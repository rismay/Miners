// Copyright © 2011, Jakob Bornecrantz.  All rights reserved.
// See copyright notice in src/charge/charge.d (GPLv2 only).
module miners.terrain.finite;

import charge.charge;

import miners.types;
import miners.defines;
import miners.options;
import miners.gfx.vbo;
import miners.gfx.imports;
import miners.terrain.common;
import miners.builder.builder;
import miners.builder.workspace;


/**
 * Finite terrain that doesn't doesn't handle growing as good
 * as infinite terrain (like alpha/beta). Used for classic levels.
 *
 * Has a minimum size of 16x128x16.
 */
final class FiniteTerrain : public Terrain
{
private:
	mixin SysLogging;

public:
	int xSize;
	int ySize;
	int zSize;

	/** Height of meta data in bytes */
	int yMetaSize;

	/**
	 * Chunks here refere to VBO's.
	 */
	uint xNumChunks;
	uint yNumChunks;
	uint zNumChunks;
	uint totalNumChunks;

	uint xStride;
	uint yStride;
	uint zStride;

	size_t sizeBlocks;
	size_t sizeData;

protected:
	ubyte *blocks;
	ubyte *data;

	cMemoryArray!(ubyte) store;

	GfxVBO vbos[];
	bool gfx[];
	bool dirty[];

	int xSaved;
	int ySaved;
	int zSaved;

public:
	this(GameWorld w, Options opts,
	     int x, int y, int z,
	     bool useClassicTerrain)
	{
		l.info("Created (%sx%sx%s)", x, y, z);

		if (x < 1 || y < 1 || z < 1 )
			throw new Exception("Size must be at least 1x1x1 for FiniteTerrain");

		xSize = x;
		ySize = y;
		zSize = z;

		yMetaSize = ySize / 2 + (ySize % 2);

		xNumChunks = xSize / BuildWidth;
		yNumChunks = ySize / BuildHeight;
		zNumChunks = zSize / BuildDepth;

		// Add a extra chunk if nSize % Buildn != 0
		if (xNumChunks * BuildWidth < xSize)
			xNumChunks++;
		if (yNumChunks * BuildHeight < ySize)
			yNumChunks++;
		if (zNumChunks * BuildDepth < zSize)
			zNumChunks++;

		totalNumChunks = xNumChunks * yNumChunks * zNumChunks;
		gfx.length = totalNumChunks;
		vbos.length = totalNumChunks;
		dirty.length = totalNumChunks;

		xStride = ySize;
		yStride = 1;
		zStride = ySize * xSize;

		sizeBlocks = xSize * ySize * zSize;
		sizeData = xSize * yMetaSize * zSize;;

		store.length = sizeBlocks + sizeData;

		blocks = store.ptr;
		data = store.ptr + sizeBlocks;

		super(w, opts, useClassicTerrain);
	}

	~this()
	{
		unbuildAll();
		store.free();
	}


	/*
	 *
	 * Block access.
	 *
	 */


	final Block opIndex(int x, int y, int z)
	{
		Block b;
		if (x < 0 || y < 0 || z < 0)
			return b;
		if (x >= xSize || y >= ySize || z >= zSize)
			return b;

		b.type = *getTypePointerUnsafe(x, y, z);
		b.meta = *getMetaPointerUnsafe(x, y, z);

		if (y % 2 == 0)
			b.meta &= 0xf;
		else
			b.meta >>= 4;

		return b;
	}

	final Block opIndexAssign(Block b, int x, int y, int z)
	{
		if (x < 0 || y < 0 || z < 0)
			return Block();
		if (x >= xSize || y >= ySize || z >= zSize)
			return Block();

		*getTypePointerUnsafe(x, y, z) = b.type;

		auto ptr = getMetaPointerUnsafe(x, y, z);
		auto meta = *ptr;

		if (y % 2 == 0)
			*ptr = (meta & 0xf0) | (b.meta & 0x0f);
		else
			*ptr = cast(ubyte)(b.meta << 4) | (meta & 0x0f);

		return b;
	}



	/*
	 *
	 * Block and metadata accessors.
	 *
	 */


	/**
	 * Get the type of the block at coords.
	 */
	final ubyte getType(int x, int y, int z)
	{
		if (x < 0 || y < 0 || z < 0)
			return 0;
		if (x >= xSize || y >= ySize || z >= zSize)
			return 0;

		return blocks[(xSize * z + x) * ySize + y];
	}

	/**
	 * Set the block type at the given location.
	 */
	final ubyte setType(ubyte type, int x, int y, int z)
	{
		if (x < 0 || y < 0 || z < 0)
			return 0;
		if (x >= xSize || y >= ySize || z >= zSize)
			return 0;

		*getTypePointerUnsafe(x, y, z) = type;

		return type;
	}

	/**
	 * Get a pointer to the block type at location.
	 */
	final ubyte *getTypePointerUnsafe(int x, int y, int z)
	{
		return &blocks[(xSize * z + x) * ySize + y];
	}

	/**
	 * Get a pointer to the metadata at location,
	 *
	 * Will return the byte that the metadata is located in.
	 * So yPos = (y / 2).
	 */
	final ubyte *getMetaPointerUnsafe(int x, int y, int z)
	{
		return &data[(xSize * z + x) * yMetaSize + (y / 2)];
	}

	/**
	 * Get a WorkspaceData copy of blocks and metadata at the given
	 * location in "chunk" coords.
	 *
	 * Only handles nPos >= 0.
	 */
	WorkspaceData* extractWorkspace(int xPos, int yPos, int zPos)
	{
		auto ws = WorkspaceData.malloc();

		assert(xPos >= 0 && yPos >= 0 && zPos >= 0);

		int xEnd = ws.ws_width;
		int yEnd = ws.ws_height;
		int zEnd = ws.ws_depth;

		int xOff = xPos * BuildWidth - 1;
		int yOff = yPos * BuildHeight - 1;
		int yOffMeta = yPos * BuildHeight;
		int zOffStart = zPos * BuildDepth - 1;

		int startX, y, yMeta, startZ;

		// Handle underflow
		if (xOff < 0) {
			startX++;
			xOff++;
		}
		if (yOff < 0) {
			y = 1;
			yMeta = 1;
			yEnd--;
			yOff++;
		}
		if (zOffStart < 0) {
			startZ++;
			zOffStart++;
		}

		// Handle overflow
		if (xOff + xEnd >= xSize)
			xEnd = xSize - xOff;
		if (yOff + yEnd >= ySize)
			yEnd = ySize - yOff;
		if (zOffStart + zEnd >= zSize)
			zEnd = zSize - zOffStart;

		// Need to include the whole last byte
		int yMetaEnd = yEnd / 2 + (yEnd % 2);

		// Could be smarter about this
		ws.zero();

		for (int x = startX; x < xEnd; x++, xOff++) {
			int zOff = zOffStart;
			for (int z = startZ; z < zEnd; z++, zOff++) {
				assert(xPos >= 0 && yPos >= 0 && zPos >= 0);

				auto ptr = getTypePointerUnsafe(xOff, yOff, zOff);
				ws.blocks[x][z][y .. y + yEnd] = ptr[0 .. yEnd];
				ptr = getMetaPointerUnsafe(xOff, yOff, zOff);
				ws.data[x][z][yMeta .. yMeta + yMetaEnd] = ptr[0 .. yMetaEnd];
			}
		}

		return ws;
	}


	/*
	 *
	 * Dirty tracking functions.
	 *
	 */


	/**
	 * Mark the given volume as dirty and rebuilt the chunks there.
	 */
	void markVolumeDirty(int x, int y, int z, uint sx, uint sy, uint sz)
	{
		// We must mark all chunks that neighbor the changed area.
		 x -= 1;  y -= 1;  z -= 1;
		sx += 2; sy += 2; sz += 2;

		int xStart = x < 0 ? (x - BuildWidth + 1) / BuildWidth : x / BuildWidth;
		int yStart = y < 0 ? (y - BuildHeight + 1) / BuildHeight : y / BuildHeight;
		int zStart = z < 0 ? (z - BuildDepth + 1) / BuildDepth : z / BuildDepth;

		x += sx;
		y += sy;
		z += sz;
		int xStop = x < 0 ? (x - BuildWidth + 1) / BuildWidth : x / BuildWidth;
		int yStop = y < 0 ? (y - BuildHeight + 1) / BuildHeight : y / BuildHeight;
		int zStop = z < 0 ? (z - BuildDepth + 1) / BuildDepth : z / BuildDepth;

		xStop++; yStop++; zStop++;

		if (xStart < 0)
			xStart = 0;
		if (yStart < 0)
			yStart = 0;
		if (zStart < 0)
			zStart = 0;

		if (xStop > xNumChunks)
			xStop = xNumChunks;
		if (yStop > yNumChunks)
			yStop = yNumChunks;
		if (zStop > zNumChunks)
			zStop = zNumChunks;

		for (x = xStart; x < xStop; x++) {
			for (z = zStart; z < zStop; z++) {
				int i = calcVboIndex(x, yStart, z);
				for (y = yStart; y < yStop; y++, i++) {
					dirty[i] = true;
				}
			}
		}
	}


	/*
	 *
	 * Inhereted terrain methods.
	 *
	 */


	/**
	 * Set the center of the view circle.
	 *
	 * XXX: Currently not implemented.
	 */
	void setCenter(int xNew, int zNew)
	{

	}

	/**
	 * Set the number of chunks around the center to be built.
	 *
	 * XXX: Currently not implemented.
	 */
	void setViewRadii(int radii)
	{

	}

	void setBuildType(TerrainBuildTypes type, char[] name)
	{
		if (currentBuildType == type)
			return;

		unbuildAll();

		doBuildTypeChange(type);

		resetBuild();
	}

	/**
	 * Start over from the begining when building "chunk" meshes.
	 */
	void resetBuild()
	{
		xSaved = ySaved = zSaved = 0;
	}

	/**
	 * Build a single "chunk" mesh.
	 */
	bool buildOne()
	{
		int x = xSaved;
		int y = ySaved;
		int z = zSaved;

		for (; x < xNumChunks; x++) {
			for (; z < zNumChunks; z++) {
				for (; y < yNumChunks; y++) {
					if (!build(x, y, z))
						continue;
					xSaved = x;
					ySaved = y++;
					zSaved = z;
					return true;
				}
				y = 0;
			}
			z = 0;
		}

		xSaved = x;
		ySaved = y;
		zSaved = z;

		return false;
	}

	void unbuildAll()
	{
		for (int x; x < xNumChunks; x++)
			for (int z; z < zNumChunks; z++)
				for (int y; y < yNumChunks; y++)
					unbuild(x, y, z);

		resetBuild();
	}


protected:
	/*
	 *
	 * Internal functions.
	 *
	 */


	bool build(int x, int y, int z)
	{
		if (!shouldBuild(x, y, z))
			return false;


		auto ws = extractWorkspace(x, y, z);
		scope(exit)
			ws.free();

		int i = calcVboIndex(x, y, z);
		GfxVBO v, old = vbos[i];
		ChunkVBOGroup g;

		if (cvgcm !is null) {
			auto cm = cast(ChunkVBOCompactMesh)old;
			v = updateCompactMesh(cm, buildIndexed, ws, x, y, z);
			g = cvgcm;

		} else if (cvgrm !is null) {
			auto rm = cast(ChunkVBORigidMesh)old;
			v = updateRigidMesh(rm, ws, x, y, z);
			g = cvgrm;
		}

		if (old !is v) {
			if (old !is null)
				g.remove(old);
			if (v !is null)
				g.add(v, x, y, z);
		}

		vbos[i] = v;
		gfx[i] = true;
		dirty[i] = false;

		return true;
	}

	void unbuild(int x, int y, int z)
	{
		int i = calcVboIndex(x, y, z);
		auto v = vbos[i];

		vbos[i] = null;
		gfx[i] = false;
		dirty[i] = false;

		if (v is null)
			return;

		if (cvgrm !is null)
			cvgrm.remove(v);
		if (cvgcm !is null)
			cvgcm.remove(v);
	}

	final uint calcVboIndex(int x, int y, int z)
	{
		return (xNumChunks * z + x) * yNumChunks + y;
	}

	final bool shouldBuild(int x, int y, int z)
	{
		int i = calcVboIndex(x, y, z);
		return dirty[i] || !gfx[i];
	}
}

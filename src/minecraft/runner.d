// Copyright © 2011, Jakob Bornecrantz.  All rights reserved.
// See copyright notice in src/charge/charge.d (GPLv2 only).
module minecraft.runner;

import std.math;

import charge.charge;

import minecraft.world;
import minecraft.terrain.chunk;
import minecraft.terrain.vol;


/**
 * Specialized runner for Minecraft.
 */
class Runner : public GameRunner
{
	abstract bool build();
}

/**
 * Specialized router for Minecraft.
 */
interface Router : public GameRouter
{
	Runner loadLevel(char[] dir);
}

/**
 * Base class for lever viewers and game logic runners.
 */
class GameRunnerBase : public Runner
{
public:
	Router r;
	World w;
	RenderManager rm;

	GfxCamera cam;
	int x; /**< Current chunk of camera */
	int z; /**< Current chunk of camera */

	bool inControl;
	bool grabbed;
	CtlKeyboard keyboard;
	CtlMouse mouse;

private:
	mixin SysLogging;

public:
	this(Router r, World w, RenderManager rm)
	{
		this.r = r;
		this.w = w;
		this.rm = rm;
		keyboard = CtlInput().keyboard;
		mouse = CtlInput().mouse;
		grabbed = true;
	}

	~this()
	{
	}

	void render(GfxRenderTarget rt)
	{
		rm.render(w.gfx, cam, rt);
	}

	void logic()
	{
		w.tick();

		// Center the map around the camera.
		{
			auto p = cam.position;
			int x = cast(int)p.x;
			int z = cast(int)p.z;
			x = p.x < 0 ? (x - 16) / 16 : x / 16;
			z = p.z < 0 ? (z - 16) / 16 : z / 16;

			if (this.x != x || this.z != z)
				w.vt.setCenter(x, z);
			this.x = x;
			this.z = z;
		}
	}

	bool build()
	{
		if (w !is null && w.vt !is null)
			return w.vt.buildOne();
		else
			return false;
	}

	void assumeControl()
	{
		if (inControl)
			return;

		// Remember grab status.
		grab = grabbed;

		keyboard.up ~= &this.keyUp;
		keyboard.down ~= &this.keyDown;

		mouse.up ~= &this.mouseUp;
		mouse.down ~= &this.mouseDown;
		mouse.move ~= &this.mouseMove;

		inControl = true;
	}

	void dropControl()
	{
		if (!inControl)
			return;

		keyboard.up.disconnect(&this.keyUp);
		keyboard.down.disconnect(&this.keyDown);

		mouse.up.disconnect(&this.mouseUp);
		mouse.down.disconnect(&this.mouseDown);
		mouse.move.disconnect(&this.mouseMove);

		inControl = false;
	}

	bool grab(bool val)
	{
		mouse.grab = val;
		mouse.show = !val;
		grabbed = val;
		return grabbed;
	}

	bool grab()
	{
		return grabbed;
	}

	abstract void keyDown(CtlKeyboard kb, int sym);
	abstract void keyUp(CtlKeyboard kb, int sym);
	abstract void mouseMove(CtlMouse mouse, int ixrel, int iyrel);
	abstract void mouseDown(CtlMouse m, int button);
	abstract void mouseUp(CtlMouse m, int button);
}

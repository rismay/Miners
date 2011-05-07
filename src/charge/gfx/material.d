// Copyright © 2011, Jakob Bornecrantz.  All rights reserved.
// See copyright notice in src/charge/charge.d (GPLv2 only).
module charge.gfx.material;

import std.regexp;
import std.conv;
import std.stdio;
import std.string;

import lib.xml.xml;

import charge.math.color;
import charge.sys.logger;
import charge.gfx.gl;
import charge.gfx.shader;
import charge.gfx.light;
import charge.gfx.texture;
import charge.gfx.renderqueue;

struct MaterialProperty
{
	enum {
		TEXTURE  = 0,
		COLOR3   = 3,
		COLOR4   = 4,
		OPTION   = 5,
	}
	char[] name;
	int type;
}

class Material
{
public:
	final bool setTexture(char[] name, char[] filename)
	{
		if (name is null)
			return false;

		auto tex = Texture(filename);
		auto ret = setTexture(name, tex);
		if (tex !is null)
			tex.dereference();

		return ret;
	}

	bool setTexture(char[] name, Texture tex)
	{
		return false;
	}

	bool setColor3f(char[] name, Color3f value)
	{
		return false;
	}

	bool setColor4f(char[] name, Color4f value)
	{
		return false;
	}

	bool setOption(char[] name, bool value)
	{
		return false;
	}

	bool getTexture(char[] name, out Texture tex)
	{
		return false;
	}

	bool getColor3f(char[] name, out Color3f value)
	{
		return false;
	}

	bool getColor4f(char[] name, out Color4f value)
	{
		return false;
	}

	bool getOption(char[] name, out bool value)
	{
		return false;
	}

	MaterialProperty[] getPropList()
	{
		return [];
	}

}

class SimpleMaterial : public Material
{
public:
	Texture tex;
	Color4f color;
	bool fake;

	this()
	{
		color = Color4f.White;
		super.setTexture("tex", "res/default.png");
	}

	~this()
	{
		if (this.tex)
			this.tex.dereference();
	}

	MaterialProperty[] getPropList()
	{
		static MaterialProperty[] list = [
			{"tex", MaterialProperty.TEXTURE},
			{"color", MaterialProperty.COLOR3},
			{"fake", MaterialProperty.OPTION}
		];
		return list;
	}

	bool setTexture(char[] name, Texture tex)
	{
		if (name is null)
			return false;

		switch(name) {
			case "tex":
				if (this.tex)
					this.tex.dereference();
				this.tex = tex;
				tex.reference();
				break;
			default:
				return false;
		}

		return true;
	}

	bool setColor3f(char[] name, Color3f color)
	{
		if (name is null)
			return false;

		switch(name) {
			case "color":
				this.color = Color4f(color);
				break;
			default:
				return false;
		}

		return true;
	}

	bool setOption(char[] name, bool option)
	{
		switch(name) {
			case "fake":
				fake = option;
				break;
			default:
				return false;
		}

		return true;
	}

	bool getTexture(char[] name, out Texture tex)
	{
		if (name is null)
			return false;

		switch(name) {
			case "tex":
				tex = this.tex;
				break;
			default:
				return false;
		}

		return true;
	}

	bool getColor3f(char[] name, out Color3f color)
	{
		if (name is null)
			return false;

		switch(name) {
			case "color":
				color = Color3f(this.color.r, this.color.g, this.color.b);
				break;
			default:
				return false;
		}

		return true;
	}

	bool getOption(char[] name, out bool option)
	{
		switch(name) {
			case "fake":
				option = this.fake;
				break;
			default:
				return false;
		}

		return true;
	}

}

class MaterialManager
{
private:
	mixin Logging;

	static RegExp value3;
	static RegExp value4;
	static Material defaultMaterial;

	static this()
	{
		value3 = RegExp(`(\S+)\s+(\S+)\s+(\S+)`);
		value4 = RegExp(`(\S+)\s+(\S+)\s+(\S+)\s+(\S+)`);
	}

public:

	static Material getDefault()
	{
		return new SimpleMaterial();
	}

	static Material opCall(char[] filename)
	{
		Element f;

		try {
			f = DomParser(filename);
		} catch (XmlException xe) {
			l.error(xe.msg);
			return null;
		}

		auto m = new SimpleMaterial();

		try {
			process(m, Handle(f));
		} catch (Exception e) {
			l.error(e.msg);
		}

		l.info("Loaded material ", filename);
		return m;
	}

	static void process(Material m, Handle f)
	{
		auto list = m.getPropList();
		foreach(prop; list) {
			auto e = f.first(prop.name).first().text;

			if (e is null)
				continue;

			switch(prop.type) {
				case MaterialProperty.TEXTURE:
					char[] t = e.value;
					m.setTexture(prop.name, t);
					break;
				case MaterialProperty.COLOR3:
					Color3f c;
					char[] t = e.value;
					if (exColor3f(t, c))
						m.setColor3f(prop.name, c);
					break;
				case MaterialProperty.COLOR4:
					Color4f c;
					char[] t = e.value;
					if (exColor4f(t, c))
						m.setColor4f(prop.name, c);
					break;
				case MaterialProperty.OPTION:
					bool b;
					char[] t = e.value;
					if (exBool(t, b))
						m.setOption(prop.name, b);
					break;
				default:
					break;
			}
		}
	}

	static bool exColor3f(char[] text, out Color3f r)
	{
		auto p = value3.exec(text);
		if (p.length < 4)
			return false;

		try {
			r.r = toFloat(p[1]);
			r.g = toFloat(p[2]);
			r.b = toFloat(p[3]);
		} catch (ConvError ce) {
			return false;
		} catch (ConvOverflowError cof) {
			return false;
		}

		return true;
	}

	static bool exColor4f(char[] text, out Color4f r)
	{
		auto p = value4.exec(text);
		if (p.length < 5)
			return false;

		try {
			r.r = toFloat(p[1]);
			r.g = toFloat(p[2]);
			r.b = toFloat(p[3]);
			r.a = toFloat(p[4]);
		} catch (ConvError ce) {
			return false;
		} catch (ConvOverflowError cof) {
			return false;
		}

		return true;
	}

	static bool exBool(char[] text, out bool b)
	{
		if (cmp(text, "true")) {
			b = true;
		} else if (cmp(text, "false")) {
			b = false;
		} else {
			return false;
		}
		return true;
	}

}

module minecraft.lua.runner;

import std.file;

import charge.charge;
import charge.game.lua;

import minecraft.world;
import minecraft.lua.actors;
import minecraft.terrain.vol;
import minecraft.terrain.chunk;

class ScriptRunner
{
public:
	World w;
	LuaState s;
	SunLight sl;
	Camera c;

	CtlMouse mouse;
	CtlKeyboard keyboard;

	bool initialized;

private:
	mixin SysLogging;

public:
	this(World w, char[] filename)
	{
		this.w = w;

		if (!exists(filename)) {
			l.warn("No such file (%s) (this is not a error)", filename);
			throw new Exception("Error initalizing lua script");
		}

		// Create a lua state
		s = new LuaState();
		// Push standard libraries
		s.openLibs();

		// Registers classes
		Color4fWrapper.register(s);
		Vector3dWrapper.register(s);
		Point3dWrapper.register(s);
		QuatdWrapper.register(s);

		MouseWrapper.register(s);
		KeyboardWrapper.register(s);

		WorldWrapper.register(s);
		CameraWrapper.register(s);
		SunLightWrapper.register(s);

		setNil("World");
		setNil("Game");
		setNil("Camera");
		setNil("SunLight");

		auto ret = s.loadFile(filename);
		if (ret == 3) {
			l.warn("loadFile failed \n",
			       s.toString(-3), "\n",
			       s.toString(-2), "\n",
			       s.toString(-1), "\n");

			delete s;

			throw new Exception("Error initalizing lua script");
		}

		sl = new SunLight(w);
		c = new Camera(w);

		mouse = CtlInput().mouse;
		keyboard = CtlInput().keyboard;

		s.pushStringz("keyboard");
		s.pushClass(keyboard);
		s.setTable(lib.lua.lua.LUA_GLOBALSINDEX);

		s.pushStringz("mouse");
		s.pushClass(mouse);
		s.setTable(lib.lua.lua.LUA_GLOBALSINDEX);

		s.pushStringz("world");
		s.pushClass(w);
		s.setTable(lib.lua.lua.LUA_GLOBALSINDEX);

		s.pushStringz("camera");
		s.pushClass(c);
		s.setTable(lib.lua.lua.LUA_GLOBALSINDEX);

		s.pushStringz("light");
		s.pushClass(sl);
		s.setTable(lib.lua.lua.LUA_GLOBALSINDEX);

		ret = s.call();
		if (ret == 2) {
			l.warn("call failed\n", s.toString(-1));

			delete s;
			delete c;
			delete sl;
			throw new Exception("Error initalizing lua script");
		}

		keyboard.up ~= &this.keyUp;
		keyboard.down ~= &this.keyDown;

		mouse.up ~= &this.mouseUp;
		mouse.down ~= &this.mouseDown;
		mouse.move ~= &this.mouseMove;

		initialized = true;
	}

	~this()
	{
		if (initialized) {
			keyboard.up.disconnect(&this.keyUp);
			keyboard.down.disconnect(&this.keyDown);

			mouse.up.disconnect(&this.mouseUp);
			mouse.down.disconnect(&this.mouseDown);
			mouse.move.disconnect(&this.mouseMove);

			delete s;
			delete c;
			delete sl;
		}
	}

	void resize(uint w, uint h)
	{
		s.getGlobalz("resize");
		s.pushNumber(w);
		s.pushNumber(h);

		if (s.call(2) == 2) {
			l.warn(s.toString(-1));
		}
	}

	void logic()
	{
		s.getGlobalz("logic");
		if (s.call() == 2) {
			l.warn(s.toString(-1));
		}
	}

	void render()
	{
		s.getGlobalz("render");
		if (s.call() == 2) {
			l.warn(s.toString(-1));
		}

	}

protected:
	void setNil(char* str)
	{
		s.pushStringz(str);
		s.pushNil();
		s.setTable(lib.lua.lua.LUA_GLOBALSINDEX);
	}

	void keyUp(CtlKeyboard kb, int sym)
	{
		s.getGlobalz("keyUp");
		s.pushNumber(sym);

		if (s.call(1) == 2) {
			l.warn(s.toString(-1));
		}
	}

	void keyDown(CtlKeyboard kb, int sym)
	{
		s.getGlobalz("keyDown");
		s.pushNumber(sym);

		if (s.call(1) == 2) {
			l.warn(s.toString(-1));
		}
	}

	void mouseUp(CtlMouse m, int button)
	{
		s.getGlobalz("mouseUp");
		s.pushNumber(button);

		if (s.call(1) == 2) {
			l.warn(s.toString(-1));
		}
	}

	void mouseDown(CtlMouse m, int button)
	{
		s.getGlobalz("mouseDown");
		s.pushNumber(button);

		if (s.call(1) == 2) {
			l.warn(s.toString(-1));
		}
	}

	void mouseMove(CtlMouse mouse, int xrel, int yrel)
	{
		s.getGlobalz("mouseMove");
		s.pushNumber(xrel);
		s.pushNumber(yrel);

		if (s.call(2) == 2) {
			l.warn(s.toString(-1));
		}
	}
}
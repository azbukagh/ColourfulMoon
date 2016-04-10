module ColourfulMoon;
import std.array : appender;

/**
* Simple text styling library
*/

/**
* Text style
* Params:
*	s = input text
* Returns: Styled text.
*/

private T Style(T, S...)(S anotherS) {
	auto a = appender!T();
	foreach(i; anotherS)
		a.put(i);
	return a.data;
}

T Reset(T)(T s = "") {
	version(Posix) {
		return Style!T(s, "\033[0m");
	} else {
		return s;
	}
}
/// ditto
T Bold(T)(T s = "") {
	version(Posix) {
		return Style!T("\033[1m", s);
	} else {
		return s;
	}
}
/// ditto
T Underline(T)(T s = "") {
	version(Posix) {
		return Style!T("\033[4m", s);
	} else {
		return s;
	}
}
/// ditto
T Blink(T)(T s = "") {
	version(Posix) {
		return Style!T("\033[5m", s);
	} else {
		return s;
	}
}
/// ditto
T Reverse(T)(T s = "") {
	version(Posix) {
		return Style!T("\033[7m", s);
	} else {
		return s;
	}
}

struct Colour {
	ubyte R, G, B;

	string toConsole() {
		import std.math : floor;
		import std.conv : to;

		if(R == G && R == B) {
			return to!string((R > 239) ? 15 : floor(cast(real) R / 10) + 232);
		} else {
			return to!string(16 + 36 * floor(cast(real) R / 51) + 6 * floor(cast(real) G / 51) + floor(cast(real) B / 51));
		}
	}
}

/**
* Text colour
* Params:
*	s = input text
*	R = Red
*	G = Green
*	B = Blue
* Returns: Coloured text.
*/
T Foreground(T)(T s = "", Colour c = Colour()) {
	version(Posix) {
		return Style!T("\033[38;05;", c.toConsole(), "m", s);
	} else {
		return s;
	}
}
/// ditto
T Background(T)(T s = "", Colour c = Colour()) {
	version(Posix) {
		return Style!T("\033[48;05;", c.toConsole(), "m", s);
	} else {
		return s;
	}
}

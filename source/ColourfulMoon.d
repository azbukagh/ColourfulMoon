module ColourfulMoon;
struct Colour {
	ubyte R, G, B;

	real toConsole() {
		import std.math : floor;

		if(R == G && R == B) {
			return (R > 239) ? 15 : floor(cast(real) R / 10) + 232;
		} else {
			return 16 + 36 * floor(cast(real) R / 51) + 6 * floor(cast(real) G / 51) + floor(cast(real) B / 51);
		}
	}

	bool empty() {
		return (R == G) &&
			(R == B) &&
			(R == 0);
	}
}

struct Style {
	private {
		bool bold, underline, blink, reverse;
		Colour background, foreground;
	}

	Style Bold() {
		bold = bold ? false : true;
		return this;
	}

	Style Underline() {
		underline = underline ? false : true;
		return this;
	}

	Style Blink() {
		blink = blink ? false : true;
		return this;
	}

	Style Reverse() {
		reverse = reverse ? false : true;
		return this;
	}

	Style Background(Colour b) {
		background = b;
		return this;
	}

	Style Foreground(Colour b) {
		foreground = b;
		return this;
	}

	string apply(string s = "") {
		import std.array : appender;
		import std.format : formattedWrite;
		import std.conv : to;

		size_t[] o;
		if(bold)
			o ~= 1;
		if(underline)
			o ~= 4;
		if(blink)
			o ~= 5;
		if(reverse)
			o ~= 7;

		if(!background.empty)
			o ~= [48, 0x05, to!size_t(background.toConsole)];

		if(!foreground.empty)
			o ~= [38, 0x05, to!size_t(foreground.toConsole)];

		
		
		auto writer = appender!string();
		formattedWrite(writer, "\033[%(%s;%)m%s\033[0m", o, s);

		return writer.data;
	}
}

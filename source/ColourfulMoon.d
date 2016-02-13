module ColourfulMoon;
/**
* Simple text styling library
*/

/**
* Text style
* Params:
*	s = input text
* Returns: Styled text.
*/
string Reset(string s = "") {
	return s ~ "\033[0m";
}
/// ditto
string Bold(string s = "") {
	return "\033[1m" ~ s;
}
/// ditto
string Underline(string s = "") {
	return "\033[4m" ~ s;
}
/// ditto
string Blink(string s = "") {
	return "\033[5m" ~ s;
}
/// ditto
string Reverse(string s = "") {
	return "\033[7m" ~ s;
}

private string Colour(ubyte R = 0, ubyte G = 0, ubyte B = 0) {
	import std.math : floor;
	import std.conv : to;

	if(R == G && R == B) {
		return to!string((R > 239) ? 15 : floor(cast(real) R / 10) + 232);
	} else {
		return to!string(16 + 36 * floor(cast(real) R / 51) + 6 * floor(cast(real) G / 51) + floor(cast(real) B / 51));
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
string Foreground(string s = "", ubyte R = 0, ubyte G = 0, ubyte B = 0) {
	return "\033[38;05;" ~ Colour(R, G, B) ~ "m" ~ s;
}
/// ditto
string Background(string s = "", ubyte R = 0, ubyte G = 0, ubyte B = 0) {
	return "\033[48;05;" ~ Colour(R, G, B) ~ "m" ~ s;
}

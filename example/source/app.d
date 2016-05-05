import std.stdio;
import ColourfulMoon;
void main() {
	"C"
		.Foreground(Colour(0xA4, 0xA0, 0x9B))
		.Underline
		.write;
	"olourful"
		.Background(Colour(0x0f, 0x24, 0x44))
		.write;
	"M"
		.Foreground(Colour(0x0f, 0x24, 0x44))
		.Background(Colour(0xA4, 0xA0, 0x9B))
		.write;
	"oon"
		.Reset
		.writeln;

	
	writeln("This is a fast and small library for styling and painting a text");
	writeln("No dependencies - only awesomeness!");
	writefln("Use it with %s, because it is simple",
		"formatter".Underline.Reset);
	"Or in "
		.write;
	"std.stdio "
		.Bold
		.Reset
		.write;
	"style."
		.writeln;

	"By reporting about bugs you make ColourfulMoon better. "
		.write;
	"Write Now!"
		.Blink
		.writeln;
}

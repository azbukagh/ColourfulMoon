import std.stdio;
import ColourfulMoon;
void main() {
	Style s;
	s.Foreground(Colour(0xA4, 0xA0, 0x9B))
		.Underline
		.apply("C")
		.write;
	s.Background(Colour(0x0f, 0x24, 0x44))
		.apply("olour")
		.write;
// 	"M"
// 		.Foreground(0x0f, 0x24, 0x44)
// 		.Background(0xA4, 0xA0, 0x9B)
// 		.write;
// 	"oon"
// 		.Reset
// 		.writeln;
// 
// 	
// 	writeln("This is a fast and small library for styling and painting a text");
// 	writeln("No dependencies - only awesomeness!");
// 	writefln("Use it with %s, because it is simple",
// 		"formatter".Underline.Reset);
// 	"Or in "
// 		.write;
// 	"std.stdio "
// 		.Bold
// 		.Reset
// 		.write;
// 	"style."
// 		.writeln;
}

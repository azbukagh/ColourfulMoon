ColourfulMoon
=============
Paint your text simple!

## Usage
There are 2 different ways to use ColourfulMoon.
1. Just call the functions:
```
writeln(Bold(Underline("Text")));
```
This is a bad way - it is hard to read this code.
2. Use std.stdio style:
```
"Text".Bold.Underline.writeln;
```
So, just use second way.

## Functions
- *Reset*. Resets styles.
- *Bold*. Makes text bold.
- *Underline*. Underlines text.
- *Blink*. Make text blinked.
- *Reverse*. Reverses Foreground <-> Background.

- *Foreground* Colour text face to given R, G, B.
- *Backround* Colour text background to given R, G, B.


## Understanding operation order
All functions (except *Reset*) are applying right-to-left.
```
"Text".Bold.Underline.Reverse.Blink.writeln;
// <-------------------------------
```
As first, text become blinked, then reversed, then underlined, then bolded.

*Foreground* and *Background* doesn't rewritable!
You can't do something like this:
```
"text".Foreground(0, 0, 0).Bold.Foreground(156, 156, 156).writeln;
// Text has colour 156,156,156, not 0,0,0.
```

To reset style of text - use *Reset*:
```
"text".Foreground(0, 0, 0).Bold.Reset.Foreground(156, 156, 156).writeln;
// <-----------------------------------------------------
//                                ---------->
// Reset works from left-to-right. Now text has 0,0,0 colour.
```

## Example
Aviable in `./example`.

## TODO
- [ ] Speed up code by use of Ranges or something like this
- [ ] Windows support
- [ ] Test on BSD, OS X, etc.

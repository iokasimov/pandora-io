module Pandora.IO.ASCII where

data Letter = A | B | C | D | E | F | G | H | I | J | K | L | M | N | O | P | Q | R | S | T | U | V | W | X | Y | Z

data family Case a
data instance Case Letter = Uppercase | Lowercase

data Number = N0 | N1 | N2 | N3 | N4 | N5 | N6 | N7 | N8 | N9

data Bracket = Round | Square | Angle | Curly

data family Position a
data instance Position Bracket = Opened | Closed

data Sign = Exclamation | Doublequote | Hash | Dollar
	| Percent | Ampersand | Apostrophe | Asterisk
	| Plus | Comma | Minus | Period | Slash | At
	| Backslash | Caret | Underscores | Accent | Bar | Tilde

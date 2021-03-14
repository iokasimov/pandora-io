module Pandora.IO.ASCII where

data Letter = A | B | C | D | E | F | G | H | I | J | K | L | M | N | O | P | Q | R | S | T | U | V | W | X | Y | Z

data family Case a
data instance Case Letter = Upper | Lower

data Number = N0 | N1 | N2 | N3 | N4 | N5 | N6 | N7 | N8 | N9

data Sign = Exclamation | Quote Quote | Hash | Dollar
	| Percent | Ampersand | Apostrophe | Asterisk
	| Plus | Comma | Minus | Period | Slash Slash
	| Colon | Semicolon | At | Caret | Underscore | Accent | Bar | Tilde

data Bracket = Round | Square | Angle | Curly

data family Position a
data instance Position Bracket = Opened | Closed

data Slash = Forward | Back

data Quote = Double | Single

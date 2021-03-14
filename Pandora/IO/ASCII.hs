module Pandora.IO.ASCII where

data ASCII = Control Control | Sign Sign | Letter Case Letter | Number Number

data Control = NUL | SOH | STX | ETX | EOT | ENQ
	| ACK | BEL | BS | HT | LF | VT | FF | CR | SO | SI
	| DLE | DC1 | DC2 | DC3 | DC4 | NAK | SYN | ETB | CAN
	| EM | SUB | ESC | FS | GS | RS | US | SP | DEL

data Sign = Exclamation | Quote Quote | Hash | Dollar | Percent | Ampersand | Apostrophe
	| Asterisk | Plus | Comma | Minus | Period | Slash Slash | Bracket Position Bracket
	| Colon | Semicolon | At | Caret | Underscore | Accent | Bar | Tilde

data Bracket = Round | Square | Angle | Curly

data Position = Opened | Closed

data Slash = Forward | Back

data Quote = Double | Single

data Letter = A | B | C | D | E | F | G | H | I | J | K | L
	| M | N | O | P | Q | R | S | T | U | V | W | X | Y | Z

data Case = Upper | Lower

data Number = N0 | N1 | N2 | N3 | N4 | N5 | N6 | N7 | N8 | N9

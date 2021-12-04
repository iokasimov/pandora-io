module Pandora.IO.ASCII where

import Pandora.Pattern.Object.Setoid (Setoid ((==)))
import Pandora.Pattern.Object.Ringoid (Ringoid ((*)))
import Pandora.Paradigm.Primary.Object.Boolean (Boolean (True, False))

data ASCII = Control Control | Sign Sign | Letter Case Letter | Number Number

instance Setoid ASCII where
	Control c == Control c' = c == c'
	Sign s == Sign s' = s == s'
	Letter с l == Letter с' l' = (с == с') * (l == l')
	Number n == Number n' = n == n'
	_ == _ = False

data Control = NUL | SOH | STX | ETX | EOT | ENQ
	| ACK | BEL | BS | HT | LF | VT | FF | CR | SO | SI
	| DLE | DC1 | DC2 | DC3 | DC4 | NAK | SYN | ETB | CAN
	| EM | SUB | ESC | FS | GS | RS | US | SP | DEL

instance Setoid Control where
	NUL == NUL = True
	SOH == SOH = True
	STX == STX = True
	ETX == ETX = True
	EOT == EOT = True
	ENQ == ENQ = True
	ACK == ACK = True
	BEL == BEL = True
	BS == BS = True
	HT == HT = True
	LF == LF = True
	VT == VT = True
	FF == FF = True
	CR == CR = True
	SO == SO = True
	SI == SI = True
	DLE == DLE = True
	DC1 == DC1 = True
	DC2 == DC2 = True
	DC3 == DC3 = True
	DC4 == DC4 = True
	NAK == NAK = True
	SYN == SYN = True
	ETB == ETB = True
	CAN == CAN = True
	EM == EM = True
	SUB == SUB = True
	ESC == ESC = True
	FS == FS = True
	GS == GS = True
	RS == RS = True
	US == US = True
	SP == SP = True
	DEL == DEL = True
	_ == _ = False

data Sign = Exclamation | Quote Quote | Hash | Dollar | Percent | Ampersand | Apostrophe
	| Asterisk | Plus | Comma | Minus | Period | Slash Slash | Bracket Position Bracket
	| Colon | Semicolon | At | Caret | Underscore | Accent | Bar | Tilde | Equality

instance Setoid Sign where
	Exclamation == Exclamation = True
	Quote q == Quote q' = q == q'
	Hash == Hash = True
	Dollar == Dollar = True
	Percent == Percent = True
	Ampersand == Ampersand = True
	Apostrophe == Apostrophe = True
	Asterisk == Asterisk = True
	Plus == Plus = True
	Comma == Comma = True
	Minus == Minus = True
	Period == Period = True
	Slash s == Slash s' = s == s'
	Bracket p b == Bracket p' b' = (p == p') * (b == b')
	Colon == Colon = True
	Semicolon == Semicolon = True
	At == At = True
	Caret == Caret = True
	Underscore == Underscore = True
	Accent == Accent = True
	Bar == Bar = True
	Tilde == Tilde = True
	_ == _ = False

data Bracket = Round | Square | Angle | Curly

instance Setoid Bracket where
	Round == Round = True
	Square == Square = True
	Angle == Angle = True
	Curly == Curly = True
	_ == _ = False

data Position = Opened | Closed

instance Setoid Position where
	Opened == Opened = True
	Closed == Closed = True
	_ == _ = False

data Slash = Forward | Back

instance Setoid Slash where
	Forward == Forward = True
	Back == Back = True
	_ == _ = False

data Quote = Double | Single

instance Setoid Quote where
	Double == Double = True
	Single == Single = True
	_ == _ = False

data Letter = A | B | C | D | E | F | G | H | I | J | K | L
	| M | N | O | P | Q | R | S | T | U | V | W | X | Y | Z

instance Setoid Letter where
	A == A = True
	B == B = True
	C == C = True
	D == D = True
	E == E = True
	F == F = True
	G == G = True
	H == H = True
	I == I = True
	J == J = True
	K == K = True
	L == L = True
	M == M = True
	N == N = True
	O == O = True
	P == P = True
	Q == Q = True
	R == R = True
	S == S = True
	T == T = True
	U == U = True
	V == V = True
	W == W = True
	X == X = True
	Y == Y = True
	Z == Z = True
	_ == _ = False

data Case = Upper | Lower

instance Setoid Case where
	Upper == Upper = True
	Lower == Lower = True
	_ == _ = False

data Number = N0 | N1 | N2 | N3 | N4 | N5 | N6 | N7 | N8 | N9

instance Setoid Number where
	N0 == N0 = True
	N1 == N1 = True
	N2 == N2 = True
	N3 == N3 = True
	N4 == N4 = True
	N5 == N5 = True
	N6 == N6 = True
	N7 == N7 = True
	N8 == N8 = True
	N9 == N9 = True
	_ == _ = False

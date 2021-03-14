module Pandora.IO.ASCII where

data Letter = A | B | C | D | E | F | G | H | I | J | K | L | M | N | O | P | Q | R | S | T | U | V | W | X | Y | Z

data family Case a
data instance Case Letter = Uppercase | Lowercase

data Bracket = Round | Square | Angle | Curly

data family Position a
data instance Position Bracket = Opened | Closed

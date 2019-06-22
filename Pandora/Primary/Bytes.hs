module Pandora.Primary.Bytes (Bytes (..)) where

import "ghc-prim" GHC.Prim (ByteArray#, Int#)

-- | A slice of a 'ByteArray'.
data Bytes = Bytes
	ByteArray# -- payload
	Int# -- offset
	Int# -- length

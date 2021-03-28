module Pandora.IO (IO, module Exports) where

import Pandora.IO.ASCII as Exports
import Pandora.IO.Bytes as Exports

import "pandora" Pandora.Pattern.Category ((.))
import "pandora" Pandora.Pattern.Functor.Covariant (Covariant ((<$>)))
import "pandora" Pandora.Pattern.Functor.Pointable (Pointable (point))
import "pandora" Pandora.Pattern.Functor.Applicative (Applicative ((<*>)))
import "pandora" Pandora.Pattern.Functor.Bindable (Bindable ((>>=)))
import "pandora" Pandora.Pattern.Functor.Monad (Monad)
import "pandora" Pandora.Paradigm.Primary.Functor.Function ()

import "ghc-prim" GHC.Prim (State#, RealWorld)
import "ghc-prim" GHC.Types (IO (IO))

instance Covariant IO where
	f <$> x = bindIO x (returnIO . f)

instance Pointable IO where
	point = returnIO

instance Applicative IO where
	x <*> y = x >>= \x' -> y >>= \y' -> returnIO (x' y')

instance Bindable IO where
	(>>=) = bindIO

instance Monad IO where

returnIO :: a -> IO a
returnIO x = IO (\ s -> (# s, x #))

bindIO :: IO a -> (a -> IO b) -> IO b
bindIO (IO m) k = IO (\s -> case m s of (# new_s, a #) -> unIO (k a) new_s)

thenIO :: IO a -> IO b -> IO b
thenIO (IO m) k = IO (\s -> case m s of (# new_s, _ #) -> unIO k new_s)

unIO :: IO a -> (State# RealWorld -> (# State# RealWorld, a #))
unIO (IO a) = a

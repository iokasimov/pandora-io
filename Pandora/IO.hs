module Pandora.IO (IO, module Exports) where

import Pandora.IO.ASCII as Exports
import Pandora.IO.Bytes as Exports

import "pandora" Pandora.Pattern.Morphism.Straight (Straight (Straight))
import "pandora" Pandora.Pattern.Semigroupoid ((.))
import "pandora" Pandora.Pattern.Category (($))
import "pandora" Pandora.Pattern.Functor.Covariant (Covariant ((<$>)))
import "pandora" Pandora.Pattern.Functor.Semimonoidal (Semimonoidal (mult))
import "pandora" Pandora.Pattern.Functor.Monoidal (Monoidal (unit))
import "pandora" Pandora.Pattern.Functor.Bindable (Bindable ((=<<)))
import "pandora" Pandora.Pattern.Functor.Monad (Monad)
import "pandora" Pandora.Paradigm.Primary.Algebraic.Exponential (type (-->))
import "pandora" Pandora.Paradigm.Primary.Algebraic.Product ((:*:)((:*:)))
import "pandora" Pandora.Paradigm.Primary.Algebraic.One (One (One))
import "pandora" Pandora.Paradigm.Primary.Algebraic ()

import "ghc-prim" GHC.Prim (State#, RealWorld)
import "ghc-prim" GHC.Types (IO (IO))

instance Covariant (->) (->) IO where
	f <$> x = bindIO x (returnIO . f)

instance Semimonoidal (-->) (:*:) (:*:) IO where
	mult = Straight $ \(x :*: y) -> bindIO x $ \x' -> bindIO y $ \y' -> returnIO (x' :*: y')

instance Monoidal (-->) (->) (:*:) (:*:) IO where
	unit _ = Straight $ returnIO . ($ One)

instance Bindable (->) IO where
	f =<< x = bindIO x f

instance Monad (->) IO where

returnIO :: a -> IO a
returnIO x = IO (\ s -> (# s, x #))

bindIO :: IO a -> (a -> IO b) -> IO b
bindIO (IO m) k = IO (\s -> case m s of (# new_s, a #) -> unIO (k a) new_s)

thenIO :: IO a -> IO b -> IO b
thenIO (IO m) k = IO (\s -> case m s of (# new_s, _ #) -> unIO k new_s)

unIO :: IO a -> (State# RealWorld -> (# State# RealWorld, a #))
unIO (IO a) = a

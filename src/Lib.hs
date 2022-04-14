module Lib (
  someFunc,
) where

import Data.Function ((&))
import Data.IntSet (empty)
import ECS.Component (Component (..))
import qualified ECS.Component as Component
import ECS.World (World)
import qualified ECS.World as World

-- import qualified Entity.Prompt as Prompt
-- import qualified Framework.TurnSequence as TurnSequence
someFunc :: IO ()
someFunc =
  do
    World.for2Players
    & print

-- loop :: World.World -> World.World
-- loop (World.World (Prompt.SinglePlayerConfirm msg) t) =
--   World.World (Prompt.SinglePlayerConfirm msg) t
-- loop w = loop $ TurnSequence.advance w

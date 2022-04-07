module Lib (someFunc) where

import qualified Entity.Prompt as Prompt
import qualified Entity.World as World
import qualified Framework.TurnSequence as TurnSequence

someFunc :: IO ()
someFunc = do
  let w = World.create
  print w
  let w2 = loop w
  print w2
  print "Done"

loop :: World.World -> World.World
loop (World.World (Prompt.SinglePlayerConfirm msg) t) =
  World.World (Prompt.SinglePlayerConfirm msg) t
loop w = loop $ TurnSequence.advance w

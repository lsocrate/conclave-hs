module Lib (
  someFunc,
) where

import Data.Function ((&))
import Data.IntSet (empty)
import ECS.Component (Component (..))
import qualified ECS.Component as Component
import qualified ECS.World as World

-- import qualified Entity.Prompt as Prompt
-- import qualified Framework.TurnSequence as TurnSequence
someFunc :: IO ()
someFunc =
  do
    World.empty
    & registerGeneralSupply
    & registerPlayers [(Component.P1, Component.Red), (Component.P2, Component.Blue), (Component.P3, Component.Grey)]
    & print

-- loop :: World.World -> World.World
-- loop (World.World (Prompt.SinglePlayerConfirm msg) t) =
--   World.World (Prompt.SinglePlayerConfirm msg) t
-- loop w = loop $ TurnSequence.advance w

registerGeneralSupply :: World.World -> World.World
registerGeneralSupply world = World.emplace entity (GeneralSupply{entities = empty}) worldWithEntity
 where
  (entity, worldWithEntity) = World.create world

registerPlayers :: [(Component.PlayerNumber, Component.Color)] -> World.World -> World.World
registerPlayers [] world = world
registerPlayers ((playerNumber, playerColor) : otherPlayers) world = registerPlayers otherPlayers worldWithPlayer
 where
  (entity, worldWithEntity) = World.create world
  worldWithPlayer = World.emplace entity (Player{playerNumber = playerNumber, color = playerColor, roundsPlayed = 0}) worldWithEntity

registerPlayerTokens :: Component.Color -> Int -> World.World -> World.World
registerPlayerTokens color 0 world = world
registerPlayerTokens color n world = world
 where
  (entity, worldWithEntity) = World.create world
  worldWithPlayer = World.emplace entity ResourceToken worldWithEntity

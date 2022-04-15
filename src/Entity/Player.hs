module Entity.Player (
  Game2Player,
  Game3Player,
  Game4Player,
  playerInfo,
  PlayerInfo,
  playersFor2Player,
  playersFor3Player,
  playersFor4Player,
) where

import Data.Set (Set)
import qualified Data.Set as Set

data Game2Player = G2P1 | G2P2 deriving (Enum, Bounded, Eq, PlayerOrder, Show)

data Game3Player = G3P1 | G3P2 | G3P3 deriving (Enum, Bounded, Eq, PlayerOrder, Show)

data Game4Player = G4P1 | G4P2 | G4P3 | G4P4 deriving (Enum, Bounded, Eq, PlayerOrder, Show)

class (Bounded a, Eq a, Enum a) => PlayerOrder a where
  prevPlayer :: a -> a
  prevPlayer d
    | d == minBound = maxBound
    | otherwise = pred d

  nextPlayer :: a -> a
  nextPlayer d
    | d == maxBound = minBound
    | otherwise = succ d

playersFor2Player :: Set Game2Player
playersFor2Player = Set.fromAscList [G2P1, G2P2]

playersFor3Player :: Set Game3Player
playersFor3Player = Set.fromAscList [G3P1, G3P2, G3P3]

playersFor4Player :: Set Game4Player
playersFor4Player = Set.fromAscList [G4P1, G4P2, G4P3, G4P4]

data PlayerInfo = PlayerInfo deriving (Show)

playerInfo :: PlayerInfo
playerInfo = PlayerInfo

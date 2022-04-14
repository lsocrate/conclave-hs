module ECS.Component (Component (..), Color (..), PlayerNumber (..)) where

import Data.IntSet (IntSet)
import ECS.Entity
import qualified Entity.Turn as Turn

data Component
  = Player {playerNumber :: PlayerNumber, color :: Color, roundsPlayed :: Int}
  | Round Int Turn.Turn
  | GeneralSupply {entities :: IntSet}
  | Token
  | AgendaToken
  | NoInfluence
  | LeaderToken
  | RivalToken {playerNumber :: PlayerNumber}
  | ResourceToken
  | ColoredToken {color :: Color}
  | PlayerControlled {playerNumber :: PlayerNumber}
  deriving (Show, Eq)

data Color
  = Red
  | Blue
  | Grey
  | Orange
  deriving (Eq, Ord, Show)

data PlayerNumber
  = P1
  | P2
  | P3
  | P4
  deriving (Eq, Ord, Show)

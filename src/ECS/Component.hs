module ECS.Component (
  ResourceType (..),
  Component (..),
  Color (..),
  PlayerNumber (..),
) where

import Data.IntSet (IntSet)
import ECS.Entity
import qualified Entity.Turn as Turn

data Component gp
  = Player {playerNumber :: PlayerNumber, color :: Color, roundsPlayed :: Int}
  | Round Int Turn.Turn
  | GeneralSupply {generalSupplyTokens :: IntSet}
  | Token
  | AgendaToken
  | NoInfluence
  | LeaderToken
  | RivalToken {playerNumber :: PlayerNumber}
  | ColoredToken {color :: Color}
  | PlayerControlled {playerNumber :: PlayerNumber}
  | ResourceToken {resourceType :: ResourceType}
  | PlayerOwned {owner :: Maybe gp}
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

data ResourceType = Blood | Prestige deriving (Eq, Show)

flipResourceToken :: Component gp -> Component gp
flipResourceToken (ResourceToken{resourceType = Blood}) = ResourceToken{resourceType = Prestige}
flipResourceToken (ResourceToken{resourceType = Prestige}) = ResourceToken{resourceType = Blood}
flipResourceToken c = c

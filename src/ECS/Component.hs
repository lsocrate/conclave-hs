module ECS.Component (Component) where

import qualified Entity.Turn as Turn

data Component = Player Color
               | Round Int Turn.Turn
  deriving (Show)

data Color = Red
           | Blue
           | Grey
           | Orange
  deriving (Eq, Ord, Show)

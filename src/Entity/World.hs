module Entity.World
  ( 
  World(..), create
  )
where

import Entity.Prompt ( Prompt(NoPrompt) )
import Entity.Turn

data World = World
  { prompt :: Prompt
  , turn :: Turn
  }
  deriving (Show)

create :: World
create = World { prompt = NoPrompt
  , turn = Turn {phase = BeginningPhase CityDeckStep }
  }

module Entity.Turn
  ( 
  Turn(..)
  , Phase(..)
  , BeginningPhaseStep(..)
  , ActionPhaseStep(..)
  , EndPhaseStep(..)
  )
where


data Turn = Turn { phase :: Phase}
      deriving (Show )


data Phase =
  BeginningPhase BeginningPhaseStep
  |ActionPhase ActionPhaseStep
  |EndPhase EndPhaseStep
  deriving (Show ,Eq,Ord )

data BeginningPhaseStep =
  CityDeckStep
  |StartOfTurnStep
  |ReadyAndReturnStep
  deriving (Show,Eq, Ord)

data ActionPhaseStep =
   ActionPhaseStep
   deriving (Show,Eq, Ord)

data EndPhaseStep =
  TorporAndMendingStep
  |EndOfTurnStep
  |AntagonistStep
  |DrawStep
  deriving (Show,Eq, Ord)

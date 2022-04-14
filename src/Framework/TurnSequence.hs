module Framework.TurnSequence (
  advance,
) where

import Entity.Prompt
import Entity.Turn
import Entity.World

advance :: World -> World
advance (World p (Turn (BeginningPhase CityDeckStep))) = World p (Turn (BeginningPhase StartOfTurnStep))
advance (World p (Turn (BeginningPhase StartOfTurnStep))) = World p (Turn (BeginningPhase ReadyAndReturnStep))
advance (World p (Turn (BeginningPhase ReadyAndReturnStep))) = World p (Turn (ActionPhase ActionPhaseStep))
advance (World p (Turn (ActionPhase ActionPhaseStep))) = World p (Turn (EndPhase TorporAndMendingStep))
advance (World p (Turn (EndPhase TorporAndMendingStep))) = World p (Turn (EndPhase EndOfTurnStep))
advance (World p (Turn (EndPhase EndOfTurnStep))) = World p (Turn (EndPhase AntagonistStep))
advance (World p (Turn (EndPhase AntagonistStep))) = World p (Turn (EndPhase DrawStep))
advance (World p (Turn (EndPhase DrawStep))) = World (SinglePlayerConfirm "Finish turn") (Turn (EndPhase DrawStep))

module Entity.Prompt
  ( Prompt (..),
  )
where

data Prompt
  = NoPrompt
  | SinglePlayerConfirm {message :: String }
  deriving (Show)

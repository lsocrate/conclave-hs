module ECS.World (init, create, emplace) where

import           Prelude hiding (init)
import           ECS.Component (Component)
import qualified Data.Map.Strict as Map

type Entity = Integer

data World = World [Entity] (Map.Map Entity Component)
  deriving (Show)

init :: World
init = World [] Map.empty

create :: World -> (World, Entity)
create (World [] cs) = (World [1] cs, 1)
create (World (x:xs) cs) = let next = x + 1
                           in (World ([next, x] ++ xs) cs, next)

emplace :: World -> Entity -> Component -> World
emplace (World es ecs) e c = World es (Map.insert e c ecs)

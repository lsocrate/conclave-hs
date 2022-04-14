module ECS.World (empty, create, emplace, World) where

import qualified Data.Map.Strict as Map
import Data.Set (Set)
import qualified Data.Set as Set
import ECS.Component (Component)
import ECS.Entity (Entity)

data World = World {entities :: [Entity], components :: Map.Map Entity (Set Component)}
  deriving (Show)

empty :: World
empty = World{entities = [], components = Map.empty}

create :: World -> (Entity, World)
create (World{entities = []}) = (1, World{entities = [1], components = Map.empty})
create (World{entities = es, components = cs}) =
  ( nextEntity es
  , World
      { entities = nextEntity es : es
      , components = cs
      }
  )

nextEntity :: [Entity] -> Entity
nextEntity [] = 1
nextEntity (e : es) = e + 1

-- FIX. It's replacing instead of adding
emplace :: Entity -> Component -> World -> World
emplace e c world = world{components = Map.insert e (Set.singleton c) (components world)}

-- FIX THIS
emplaceAll :: Entity -> Set Component -> World -> World
emplaceAll e cs world = world{components = Map.insert e cs (components world)}

module ECS.World (
  for2Players,
  for3Players,
  for4Players,
  World,
) where

import Data.Function ((&))
import qualified Data.Map.Strict as Map
import Data.Set (Set)
import qualified Data.Set as Set
import ECS.Component (Component (ResourceToken))
import qualified ECS.Component as C
import ECS.Entity (Entity)
import Entity.Player

data World gp = World {players :: Set gp, components :: Map.Map Entity (Set (Component gp))}
  deriving (Show)

for2Players :: World Game2Player
for2Players = worldWithPlayers playersFor2Player

for3Players :: World Game3Player
for3Players = worldWithPlayers playersFor3Player

for4Players :: World Game4Player
for4Players = worldWithPlayers playersFor4Player

worldWithPlayers :: Eq gp => Set gp -> World gp
worldWithPlayers ps = World{players = ps, components = comps}
 where
  comps = Set.foldl thing [] ps & Map.fromDescList

thing :: Eq gp => [(Entity, Set (Component gp))] -> gp -> [(Entity, Set (Component gp))]
thing cs p =
  ( reverse
      [ (x, Set.fromAscList [C.ResourceToken C.Prestige, C.PlayerOwned (Just p)])
      | x <- take 32 $ iterate (+ 1) (length cs)
      ]
  )
    ++ cs

-- tokenEntities = Set.foldl (\es _ -> nextEntity es : es) [] ps
-- componentEntities = Map.fromDistinctDescList $ map (\e -> (e, Set.singleton ResourceToken)) tokenEntities

-- create :: Set (Component gp) -> World gp -> World gp
-- create w = (newEntity, w{entities = newEntity : entities w})
--  where
--   newEntity = nextEntity $ entities w

-- nextEntity :: [Entity] -> Entity
-- nextEntity [] = 1
-- nextEntity (e : es) = e + 1

-- -- FIX. It's replacing instead of adding
-- emplace :: Entity -> Component gp -> World gp -> World gp
-- emplace e c world = world{components = Map.insert e (Set.singleton c) (components world)}

-- -- FIX THIS
-- emplaceAll :: Entity -> Set (Component gp) -> World gp -> World gp
-- emplaceAll e cs world = world{components = Map.insert e cs (components world)}

module DayOne (partA, partB) where

import Data.List (maximum, sum, take, sortOn)
import Text.Read (readMaybe)
import Data.Maybe (mapMaybe)
import Data.Text as T (lines, splitOn, unpack, pack)
import Data.Ord (Down(Down))

caloriesOfElves :: String -> [Int]
caloriesOfElves x = map (sum . convertToInt) parsedCalories
    where
        convertToInt = mapMaybe (readMaybe . unpack)
        parsedCalories = T.lines <$> splitOn (pack "\n\n") (pack x)

partA :: String -> Int
partA x = maximum $ caloriesOfElves x

-- use sortOn Down to avoid having to reverse the list
partB :: String -> Int
partB x = sum $ take 3 $ sortOn Down $ caloriesOfElves x


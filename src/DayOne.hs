module DayOne (dayOnePartOne, dayOnePartTwo) where

import Data.List as L
import Text.Read as R
import Data.Maybe as M
import Data.Text as T
import Data.Ord as O

type Input = T.Text
type Output = Int

caloriesOfElves :: Input -> [Output]
caloriesOfElves x = sum . M.mapMaybe convertToInt . T.lines <$> splitByElf x
    where
        splitByElf = splitOn (pack "\n\n")
        convertToInt y = R.readMaybe $ T.unpack y :: Maybe Int

highestCalories :: Input -> Output
highestCalories x = L.maximum $ caloriesOfElves x

-- use sortOn Down to avoid having to reverse the list
sumOfTopThreeCalories :: Input -> Output
sumOfTopThreeCalories x = L.sum $ L.take 3 $ L.sortOn O.Down $ caloriesOfElves x

dayOnePartOne = highestCalories
dayOnePartTwo = sumOfTopThreeCalories

module DayThree (partA, partB) where

import Data.Char (ord, isLower, isUpper)

half :: String -> (String, String)
half list = splitAt (length list `div` 2) list

getCommonItem :: (String, String) -> Char
getCommonItem (x, y) = head $ filter (\a -> a `elem` y) x

getPriority :: Char -> Int
getPriority x
    | isLower x = ord x - ord 'a' + 1
    | isUpper x = ord x - ord 'A' + 27
    | otherwise = 0

getCommonBadge :: (String, String, String) -> Char
getCommonBadge (x, y, z) = head $ filter (\a -> a `elem` y && a `elem` z) x

partA :: String -> Int
partA x = sum $ map (getPriority . getCommonItem . half) (lines x)

partB :: String -> Int
partB x = sum $ map (getPriority . getCommonBadge) (listToTriplet $ lines x)
    where listToTriplet (a:b:c:xs) = (a, b, c) : listToTriplet xs
          listToTriplet _ = []

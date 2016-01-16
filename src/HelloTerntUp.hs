module Main where

import TerntUp

main :: IO ()
main = do
  let xs = [-100 .. 0] ++ [1 .. 100]
  let ys = map terntUp xs
  let zs = map terntDown ys

  mapM_ print xs
  mapM_ putStrLn ys
  mapM_ print zs

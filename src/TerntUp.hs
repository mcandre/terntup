module TerntUp where

tUp :: Integer -> (Char, Integer)
tUp 0 = ('0', 0)
tUp 1 = ('1', 0)
tUp 2 = ('T', 1)

terntUp :: Integer -> String
terntUp 0 = "0"
terntUp n = terntUp' n ""
  where
    terntUp' :: Integer -> String -> String
    terntUp' 0 digits = digits
    terntUp' n digits = terntUp' (quo + carry) (t:digits)
      where
        (quo, rem) = n `divMod` 3
        (t, carry) = tUp rem

tDown :: Char -> Integer
tDown '0' = 0
tDown '1' = 1
tDown '+' = 1
tDown 'T' = -1
tDown 't' = -1
tDown '-' = -1
tDown d = error ("Parse error for digit " ++ [d])

terntDown :: String -> Integer
terntDown digits = terntDown' (reverse digits) 0 0
  where
    terntDown' :: String -> Integer -> Integer -> Integer
    terntDown' "" subtotal _ = subtotal
    terntDown' (d:ds) subtotal exp = terntDown' ds (subtotal + tDown d * 3 ^ exp) (exp + 1)

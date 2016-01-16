-- |
-- TerntUp
-- offers terntUp/terntDown functions for printing/parsing between Integers and balanced ternary string representations
module TerntUp where

-- | Determine the appropriate balanced ternary digit and carry value for a decimal digit
tUp :: Integer -> (Char, Integer)
tUp 0 = ('0', 0)
tUp 1 = ('1', 0)
tUp 2 = ('T', 1)

-- | Print an Integer to a balanced ternary string representation
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

-- | Determine the appropriate decimal digit value for a balanced ternary digit (in several styles)
tDown :: Char -> Integer
tDown '0' = 0
tDown '1' = 1
tDown '+' = 1
tDown 'T' = -1
tDown 't' = -1
tDown '-' = -1
tDown d = error ("Parse error for digit " ++ [d])

-- | Parse a balanced ternary string representation to an Integer
terntDown :: String -> Integer
terntDown digits = terntDown' (reverse digits) 0 0
  where
    terntDown' :: String -> Integer -> Integer -> Integer
    terntDown' "" subtotal _ = subtotal
    terntDown' (d:ds) subtotal exp = terntDown' ds (subtotal + tDown d * 3 ^ exp) (exp + 1)

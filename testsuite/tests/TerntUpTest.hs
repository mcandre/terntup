module TerntUpTest (
  testZeroUp,
  testZeroDown,
  testOneUp,
  testOneDown,
  testNegOneDown,
  testTwoDown,
  testNegTwoDown,
  testNeg55536Up,
  testNeg55536Down,
  propReversible
  ) where

import TerntUp

import Test.HUnit

testZeroUp :: Assertion
testZeroUp = terntUp 0 @?= "0"

testOneUp :: Assertion
testOneUp = terntUp 1 @?= "1"

testZeroDown :: Assertion
testZeroDown = terntDown "0" @?= 0

testOneDown :: Assertion
testOneDown = terntDown "1" @?= 1

testNegOneDown :: Assertion
testNegOneDown = terntDown "T" @?= -1

testTwoDown :: Assertion
testTwoDown = terntDown "1T" @?= 2

testNegTwoDown :: Assertion
testNegTwoDown = terntDown "T1" @?= -2

testNeg55536Up :: Assertion
testNeg55536Up = terntUp (-55536) @?= "T01TTT11010"

testNeg55536Down :: Assertion
testNeg55536Down = terntDown "T01TTT11010" @?= (-55536)

propReversible :: Integer -> Bool
propReversible x = ((==) x . terntDown . terntUp) x

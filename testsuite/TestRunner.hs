module Main where

import TerntUpTest

import Test.Framework.Runners.Console
import Test.Framework.Providers.HUnit
import Test.Framework.Providers.QuickCheck2

main :: IO ()
main = defaultMainWithOpts [
  testCase "zeroUp" testZeroUp,
  testCase "zeroDown" testZeroDown,
  testCase "oneUp" testOneUp,
  testCase "oneDown" testOneDown,
  testCase "negOneDown" testNegOneDown,
  testCase "twoDown" testTwoDown,
  testCase "twoNegDown" testNegTwoDown,
  testCase "neg55536Up" testNeg55536Up,
  testCase "neg55536Down" testNeg55536Down,
  testProperty "reversible" propReversible
  ] mempty

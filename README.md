# terntup - a library for converting to and from (balanced) ternary

# ABOUT

terntup converts numbers from decimal to [balanced ternary](https://en.wikipedia.org/wiki/Balanced_ternary), a base 3 number system that represents negative numbers with digits rather than a sign for the entire number; and represents all integers as a sum of positive and/or negative powers of 3.

There is no official standard for representing the digits `(0, 1-1)` in balanced ternary. Common styles include `(0, 1, T)` or `(0, +, -)`.

# EXAMPLE

```
$ ghci
Prelude> :set -package terntup
Prelude> :m +TerntUp
Prelude TerntUp> terntUp 0
"0"
Prelude TerntUp> terntDown "0"
0
Prelude TerntUp> terntUp 1
"1"
Prelude TerntUp> terntDown "1"
1
Prelude TerntUp> terntUp (-1)
"T"
Prelude TerntUp> terntDown "T"
-1
Prelude TerntUp> terntUp 2
"1T"
Prelude TerntUp> terntDown "1T"
2
Prelude TerntUp> terntUp (-2)
"T1"
Prelude TerntUp> terntDown "T1"
-2
Prelude TerntUp> terntUp 3
"10"
Prelude TerntUp> terntDown "10"
3
Prelude TerntUp> terntUp 99
"11T00"
Prelude TerntUp> terntDown "11T00"
99
Prelude TerntUp> terntUp (-55536)
"T01TTT11010"
Prelude TerntUp> terntDown "T01TTT11010"
-55536
Prelude TerntUp> terntDown "t01ttt11010"
-55536
Prelude TerntUp> terntDown "-0+---++0+0"
-55536
```

# INSTALL

```
cabal install terntup
```

# TEST

```
$ make test
```

# terntup - a library for converting to and from (balanced) ternary

# ABOUT

terntup converts numbers from decimal to [balanced ternary](https://en.wikipedia.org/wiki/Balanced_ternary), a base 3 number system that represents negative numbers with digits rather than a sign for the entire number; and represents all integers as a sum of positive and/or negative powers of 3.

There is no official standard for representing the digits `(0, 1-1)` in balanced ternary. Common styles include `(0, 1, T)` or `(0, +, -)`. For example, `99 = 1*3^4 + 1*3^3 - 1*3^2 + 0*3^1 + 0*3^0 = 11T00` in balanced ternary.

# EXAMPLE

```
$ ghci
> :set -package terntup
> :m +TerntUp
> terntUp 0
"0"
> terntDown "0"
0
> terntUp 1
"1"
> terntDown "1"
1
> terntUp (-1)
"T"
> terntDown "T"
-1
> terntUp 2
"1T"
> terntDown "1T"
2
> terntUp (-2)
"T1"
> terntDown "T1"
-2
> terntUp 3
"10"
> terntDown "10"
3
> terntUp 99
"11T00"
> terntDown "11T00"
99
> terntUp (-55536)
"T01TTT11010"
> terntDown "T01TTT11010"
-55536
> terntDown "t01ttt11010"
-55536
> terntDown "-0+---++0+0"
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

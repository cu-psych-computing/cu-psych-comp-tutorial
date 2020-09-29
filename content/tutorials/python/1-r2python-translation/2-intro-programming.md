---
title: "Intro to Programming in Python"
subtitle: "CU Psych Scientific Computing Workshop"
weight: 1103
tags: ["core", "python"]

---

## Disclaimer!
- This intro programming tutorial in Python is NOT nearly as comprehensive as the intro programming tutorial in R.
- If you have never programmed in any language before, this tutorial may skip key pieces of information.
- Instead, the goal of this tutorial is to provide some key pieces of 'translation' information for people with some programming experience who would like to use Python.

## Goals of this Lesson

### Students will:
- Understand and be comfortable working with the basic data types in Python
- Be able to use arithmetic, relational operators, and lists in Python
- For those coming from R, be aware of differences across languages, especially in indexing

## Links to Files and Video Recording
The files for all tutorials can be downloaded from [the Columbia Psychology Scientific Computing GitHub page](https://github.com/cu-psych-computing/cu-psych-comp-tutorial) using [these instructions](/accessing-files/). This particular file is located here: `/content/tutorials/python/1-r2python-translation/2-intro-programming.ipynb`.

For a video recording of this tutorial from the Fall 2020 workshop, please visit the <a href="/workshop-recording/session3/" target="_blank">Workshop Recording: Session 3</a> page.

# Variables

- Variables in Python work much in the same way they do in R.
- In Python, a single equals sign `=` is used for saving variables.



```python
myVar = 2
myVar
```




    2



Just as in R, you can reassign a variable however you want.



```python
myVar = myVar *10
myVar
```




    20



# Data Types

### Variables usually fall into 4 main data types in Python:

- integers
- floating point numbers
- strings
- boolean variables 

You can use the function `type()` to find out what kind of data type something is.


```python
var1 = 2
type(var1)
```




    int




```python
var2 = 2.0
type(var2)
```




    float




```python
var3 = 'I like to boogie'
type(var3)
```




    str




```python
var4 = True
type(var4)
```




    bool



# Arithmetic

The basic arithmetic operators work the same way as in R, *except* for exponents!

* `+` addition
* `-` subtraction
* `*` multiplication
* `/` division
* `**` exponent
* `()` parentheses


```python
3*5**2+1
```




    76



Just as in R, boolean variables are treated as numbers for math, such that `True` = `1` and `False` = `0`.


```python
True + 1
```




    2




```python
False + 1
```




    1



Just like in R, you can't do arithmetic on strings.


```python
'hi' + 1
```


    ---------------------------------------------------------------------------

    TypeError                                 Traceback (most recent call last)

    <ipython-input-10-d13b8651de05> in <module>
    ----> 1 'hi' + 1
    

    TypeError: can only concatenate str (not "int") to str


With strings, it is often also useful to see how long they are.


```python
stringVar = 'myString'
len(stringVar)
```




    8



# Printing Outputs

By default, Jupyter notebooks only print the last command in a chunk as output. However, we can get around this by using the `print()` function.


```python
var3
var4
```




    True




```python
print(var3)
print(var4)
```

    I like to boogie
    True


# Lists

Lists in Python are a rough equivalent of vectors in R. They are ordered sequences of data, and are defined by square brackets `[ ]`.

If our basic datatypes are '1-dimensional', then lists containing numeric/boolean/string data are usually thought of as '2-dimensional'. 


```python
numList = [5,6,7,8]
numList
```




    [5, 6, 7, 8]




```python
stringList = ['avocado', 'mango', 'papaya']
stringList
```




    ['avocado', 'mango', 'papaya']



Caution! While in R, all items in a vector have to be the same data type, in Python, lists can mix data types. Usually, we don't really want to do this, so it is good to be careful.


```python
mixList = [2, '2']
mixList
```




    [2, '2']



To find the length of a list we can use the `len()` function.


```python
len(numList)
```




    4



We can also add items onto the ends of lists with the `append()` function.


```python
numList.append(2)
numList
```




    [5, 6, 7, 8, 2]



# List Indexing

- One **VERY IMPORTANT** difference between R and Python is that list indexing in Python begins at 0.
- So, item 0 is always the first item in the list.
- List indexing in Python is also done with square brackets `[ ]`.


```python
numList[0]
```




    5



Using a negative number n will return the item n spots from the end.


```python
stringList[-1]
```




    'papaya'



We can index a range of items too by using the `:`.
- This will return the items including the first number, up until (but not including) the second.


```python
stringList[0:2]
```




    ['avocado', 'mango']



What happens if we go off the end of the list? 


```python
numList[4]
```




    2



We don't just use list indexing to print out specific parts of lists though. We can use this to replace values (overwrite them) in existing lists.


```python
stringList[0] = 'guacamole'
stringList
```




    ['guacamole', 'mango', 'papaya']



And, we can remove items from lists entirely with `del()`.


```python
del(stringList[0])
stringList
```




    ['mango', 'papaya']



In Python, we also want to make sure we're careful about what it is we're indexing. Strings can also be indexed in the same manner as lists, and will return the *characters* inside them at the respective indices.


```python
print(var3)
var3[2:8]
```

    I like to boogie





    'like t'



# Relational Operators

Most of the time, when you want to do things in Python, you want to do them in some conditions but not others.

Relational operators are the first key to making this happen. These are essentially inequality operators like the ones you would encounter in algebra, and return either `True` or `False`.

Relational operators work largely the same way in Python as in R.


```python
2>1
```




    True




```python
2<1
```




    False




```python
2>=1
```




    True




```python
2<=1
```




    False




```python
2 == 2
```




    True




```python
'hi' == 'hi'
```




    True




```python
2 == '2'
```




    False



Just as in R, the exclamation point is used to indicate 'not'.


```python
2 != 3
```




    True



We can use relational operators with variables as well.


```python
a = 2
b = 3
a > b
```




    False



A useful relational operator is to see whether a variable is *in* an object containing multiple pieces of data. We can use `in` for this.


```python
2 in [1,3,4]
```




    False




```python
'banana' in ['fruit', 'banana', 'antelope']
```




    True



# Logical Operators

In Python we can use `and`, `or`, and `not` to define conditions based on multiple relations.


```python
(1 == 1) & (2 == 2)
```




    True




```python
(1 == 1) and (2 == 2)
```




    True




```python
(1 == 1) or (2 == 3)
```




    True




```python
(1 == 1) and not (2 == 3)
```




    True



**Next in Fall 2020 Intro Scientific Computing Workshop:** [Data Cleaning](/tutorials/python/2-datacleaning/)

**Next in Complete Tutorial Series:** [Control Flow](/tutorials/python/1-r2python-translation/3-control-flow/)

---
title: "Control Flow in Python"
subtitle: "CU Psych Scientific Computing Workshop"
weight: 1104
tags: ["core", "python"]

---

## Goals of this lesson

#### Students will learn:
- How to use if/else and for loops in python
- How to indent code correctly in python

## Links to Files
The files for all tutorials can be downloaded from [the Columbia Psychology Scientific Computing GitHub page](https://github.com/cu-psych-computing/cu-psych-comp-tutorial) using [these instructions](/accessing-files/). This particular file is located here: `/content/tutorials/python/1-r2python-translation/3-control-flow.ipynb`.

# Indenting in python

- Python, unlike R, is *strict* about indentation! 
- Indentations in python often have bearing on the *order* in which they are executed, and switching indentation can change how code runs (or break it)
- Coming from R, indentation might seem annoying at first, but eventually this can help with code readability 
- Ultimately, python is trying to help us stay organized





![Indentation](https://www.python-course.eu/images/blocks.png)

    

# If statements

- If statements in python are the equivalent of the following English: "If condition X is met, then do action Y"
- If statements in python consist of the following syntax

`if (condition X):
    actions...`


```python
myVar = 25
if myVar > 10:
    print('Above 10!')
```

    Above 10!


## Nesting If Statements

Any conditional statements within others are called 'nested'


```python
if myVar > 5:
    print('Above 10!')
    if myVar > 20:
        print('Above 20!')
```

    Above 10!
    Above 20!


# Else Statements

- It is also very helpful to specify code that we want to run if a condition is NOT met
- Else statements in python always follow if statements, and consist of the following syntax

`if (condition X):
    actions...
 else:
    actions...`


```python
myVar2 = 'dog'
if myVar2 == 'cat':
    print('meow')
else:
    print('woof')
```

    woof


## Else If & Sequential If Statements

- We may also want to specify a series of conditions
- Python always evaluates conditions on the same nest level in order, from top to bottom 
- Elif means 'else if' -- only run this statement if the previous if statement condition was not met, and the condition following is met
- Sequential if statements on the same level will run if the statement condition is met, regardless of the previous


```python
myVar2 = 'dog'
if len(myVar2) == 3:
    print('3 letters long')
elif myVar2 == 'dog':
    print('woof')
else:
    print('unknown animal')
```

    3 letters long



```python
myVar2 = 'dog'
if len(myVar2) == 3:
    print('3 letters long')
if myVar2 == 'dog':
    print('woof')
else:
    print('unknown animal')
```

    3 letters long
    woof


# Loops

- Looping is a great way to apply the same operation to many pieces of data

### Looping through a list


```python
nums = [2,3,4,-1,7]
for number in nums:
    print(number)
```

    2
    3
    4
    -1
    7


### Looping a certain number of times



```python
for i in range(10):
    print(i)
```

    0
    1
    2
    3
    4
    5
    6
    7
    8
    9


### Fancly looping with enumerate


```python
stringList = ['banana', 'mango', 'kiwi', 'blackberry']
# fancy looping with enumerate()
for index, item in enumerate(stringList):
    print(index, item)
```

    0 banana
    1 mango
    2 kiwi
    3 blackberry


# Nested loops

![nested loops](https://javatutoring.com/wp-content/uploads/2016/12/loops-in-java.jpg)


```python
for i in stringList:
    for j in range(4):
        print(i, j)
```

    banana 0
    banana 1
    banana 2
    banana 3
    mango 0
    mango 1
    mango 2
    mango 3
    kiwi 0
    kiwi 1
    kiwi 2
    kiwi 3
    blackberry 0
    blackberry 1
    blackberry 2
    blackberry 3


**Next:** [Data Cleaning in Python](/tutorials/python/2-datacleaning/)

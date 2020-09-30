---
title: "Data Cleaning in Python"
subtitle: "CU Psych Scientific Computing Workshop"
weight: 1201
tags: ["core", "python"]

---

## Goals of this Lesson

### Students will learn:

1. How to open various data types in Python
2. How to check for missing or problematic data and address issues
3. How to filter, rearrange and shape data in preparation for analysis

## Links to Files and Video Recording
The files for all tutorials can be downloaded from [the Columbia Psychology Scientific Computing GitHub page](https://github.com/cu-psych-computing/cu-psych-comp-tutorial) using [these instructions](/accessing-files/). This particular file is located here: `/content/tutorials/python/2-datacleaning/index.ipynb`.

For a video recording of this tutorial from the Fall 2020 workshop, please visit the <a href="/workshop-recording/session3/" target="_blank">Workshop Recording: Session 3</a> page.

---
## A Quick Introduction to Python Scientific Computing Modules

As a programming languge, Python can do quite a lot. For example, it is an extremely popular choice for GUI and web-based application development (Reddit, Google, Facebook), databases (Spotify, Netflix), and scientific computing (NASA, for example, but also us!).

One reason that Python is so widely used is due to its extensive library of third-party modules. Let's start by briefly covering the most important modules for scientific computing, some (but not all) of which we'll be using today.

#### Data Analysis
- NumPy: The fundamental package for scientific computing in Python. NumPy provides Python with most of the functionality of MATLAB.
- SciPy: Provides many user-friendly and efficient numerical routines such as routines for numerical integration, interpolation, optimization, linear algebra and statistics.
- Pandas: Provides high-performance, easy-to-use data structures and data analysis tools. Pandas provides Python with most of the functionality of R.

#### Data Visualization
- Matplotlib: Python 2D plotting library which produces publication quality figures. The pyplot module provides a MATLAB-like interface and is what most people use.
- Seaborn: A Python data visualization library based on matplotlib. It provides a high-level interface for drawing attractive and informative statistical graphics.

We'll now import a few of these modules using their standard abbreviations.


```python
import numpy as np
import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sns

sns.set_context("poster")
sns.set(style="ticks",font="Arial",font_scale=2)
```

In order to call one of the functions belonging to a particular module, you can use the `.` syntax. For example, `numpy` has a `mean()` function which will compute the arithmetic mean across an axis. If we wanted to call that function, we would simply write:


```python
np.mean([2,4,6])
```




    4.0



For those coming from R, this is the equivalent of something like `dplyr::filter()`. Python is stricter than R about making sure you specify which library the function you are using comes from.

Now that you're familiar with the basics of modules in Python, let's go ahead and move on to some data cleaning.

---
## Python Data Structures

There are a few ways that data can be stored and manipulated in Python, some of which you've already covered.

To review, the first and most basic is a list:


```python
mylist = [1,2,3]
mylist
```




    [1, 2, 3]



Lists can be arbitrarily long and can store hold multiple types of data, although this isn't usually a good idea:


```python
mylist2 = [1,"2",3.0, [4,5]]
mylist2
```




    [1, '2', 3.0, [4, 5]]



Similar to lists, the `numpy` module provides the ability to work with n-dimensional arrays for **numerical** data only. We can initialize an array full of zeros using the `np.zeros()` function:


```python
myarray = np.zeros((10))
myarray
```




    array([0., 0., 0., 0., 0., 0., 0., 0., 0., 0.])



If we want to work with numerical data that has two dimensions, we can create a matrix in a very similar way:


```python
mymatrix = np.zeros((10,2))
mymatrix
```




    array([[0., 0.],
           [0., 0.],
           [0., 0.],
           [0., 0.],
           [0., 0.],
           [0., 0.],
           [0., 0.],
           [0., 0.],
           [0., 0.],
           [0., 0.]])



We won't be working much with `numpy` arrays directly today, but you should know that they are often a better option than lists when you are working with numerical data.

Today, we will primarily be working with `pandas` dataframes. This object provides functionality that is very similar to dataframes in R. Let's start by converting our empty matrix into a dataframe. We can also give each of our columns more informative names:


```python
mydataframe = pd.DataFrame(mymatrix,columns=["Height","Weight"])
mydataframe
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>Height</th>
      <th>Weight</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>0.0</td>
      <td>0.0</td>
    </tr>
    <tr>
      <th>1</th>
      <td>0.0</td>
      <td>0.0</td>
    </tr>
    <tr>
      <th>2</th>
      <td>0.0</td>
      <td>0.0</td>
    </tr>
    <tr>
      <th>3</th>
      <td>0.0</td>
      <td>0.0</td>
    </tr>
    <tr>
      <th>4</th>
      <td>0.0</td>
      <td>0.0</td>
    </tr>
    <tr>
      <th>5</th>
      <td>0.0</td>
      <td>0.0</td>
    </tr>
    <tr>
      <th>6</th>
      <td>0.0</td>
      <td>0.0</td>
    </tr>
    <tr>
      <th>7</th>
      <td>0.0</td>
      <td>0.0</td>
    </tr>
    <tr>
      <th>8</th>
      <td>0.0</td>
      <td>0.0</td>
    </tr>
    <tr>
      <th>9</th>
      <td>0.0</td>
      <td>0.0</td>
    </tr>
  </tbody>
</table>
</div>



Another way we can create a dataframe is by first creating a **dictionary** and then converting this to a dataframe. A dictionary is another type of data structure used by Python. Dictionaries consist of an unordered collection of key-value pairs. Keys are used to index the dictionary in order to access the values associated with that key. Let's start by making a simple dictionary with one key and one value:


```python
data = {'name':["Monica","Michelle","Paul","Ellen"]}
data
```




    {'name': ['Monica', 'Michelle', 'Paul', 'Ellen']}



If we index this dictionary using the `name` key, it will return the its value, which is a list of names:


```python
data['name']
```




    ['Monica', 'Michelle', 'Paul', 'Ellen']



We can also add new key-value pairs to this dictionary:


```python
data['score'] = [16,20,19,35]
data['year'] = [2, 5, 2, 1]
data
```




    {'name': ['Monica', 'Michelle', 'Paul', 'Ellen'],
     'score': [16, 20, 19, 35],
     'year': [2, 5, 2, 1]}



Similar to how we made a dataframe from our `numpy` array above, we can easily make a dataframe from this dictionary:


```python
dataframe = pd.DataFrame(data)
dataframe
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>name</th>
      <th>score</th>
      <th>year</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>Monica</td>
      <td>16</td>
      <td>2</td>
    </tr>
    <tr>
      <th>1</th>
      <td>Michelle</td>
      <td>20</td>
      <td>5</td>
    </tr>
    <tr>
      <th>2</th>
      <td>Paul</td>
      <td>19</td>
      <td>2</td>
    </tr>
    <tr>
      <th>3</th>
      <td>Ellen</td>
      <td>35</td>
      <td>1</td>
    </tr>
  </tbody>
</table>
</div>




## Reading Data into Python
---


It's easy to introduce errors if you are entering data manually like above, and with a lot of data it would get tedious. Most of the time, you'll be reading data from an external file (.txt or .csv), or opening up an existing dataset in Python. Once you find the location of your files, what you do next will depend on the file format.

#### Reminder about the `os` module

This module provides a way to interface with the operating system we are running Python on (Windows, Mac, or Linux). Let's start by first loading this module:


```python
import os
```

#### It's always important to check where our working directory is when trying to read data into Python.


```python
os.getcwd()
```




    '/Users/emily/Documents/GitHub/cu-psych-comp-tutorial/content/tutorials/python/2-datacleaning'



You can access a list of everything (all files and directories) within your working directory using the `os.listdir()` function...


```python
os.listdir()
```




    ['.DS_Store',
     'Study1_Followup.csv',
     'index.md',
     'Study2_Subjects.csv',
     'Study1_clean.csv',
     '.ipynb_checkpoints',
     'Study1.csv',
     'challenge',
     'README_Study2.txt',
     'Study2_Trials.csv',
     'index.ipynb']



...as well as in the "Files" tab on the left-hand side of the JupyterLab window.

#### What kind of file do you have?

For .txt, .csv, or any kind of delimited (such as tab-delimited) file, you can use the `pandas` function `read_table()`:


```python
#help(pd.read_table)
```


```python
mydata = pd.read_table("Study1.csv", sep=",")
```

If you know you have a .csv file, another common option is `read_csv()`, which has a default comma separator.

Remember, all of these commands can have arguments that will help Python make sense of your data. To find out what arguments are possible, you can use the `help()` function like we did above to look at what `read_table()` does.

To do this, just put whatever command you would like to learn about inside of `help()` (e.g. `help(pd.read_table)`). Remember that for functions associated with a particular module you will need to tell Python which module they come from using the `.` syntax.

You can always also Google a function to quickly find this information.

### Inspecting your data

Now that you have data, it's time to get some results! But wait! Are you sure this data is OK? Doing some basic steps to inspect your data now can save you lots of headaches later, and Python makes it really easy.

Start by checking that you have the expected number of rows and columns in your data frame. You can do this by by asking Python:


```python
# get the number of rows and columns
mydata.shape
```




    (50, 9)




```python
# get the names of columns
mydata.columns
```




    Index(['ID', 'Age', 'Sex', 'Condition', 'Personality', 'T1', 'T2', 'T3', 'T4'], dtype='object')




```python
# take a peek at the first few rows
mydata.head()
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>ID</th>
      <th>Age</th>
      <th>Sex</th>
      <th>Condition</th>
      <th>Personality</th>
      <th>T1</th>
      <th>T2</th>
      <th>T3</th>
      <th>T4</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>1</td>
      <td>21.0</td>
      <td>Female</td>
      <td>0</td>
      <td>67</td>
      <td>5</td>
      <td>2</td>
      <td>3</td>
      <td>1</td>
    </tr>
    <tr>
      <th>1</th>
      <td>2</td>
      <td>22.0</td>
      <td>Female</td>
      <td>1</td>
      <td>63</td>
      <td>4</td>
      <td>1</td>
      <td>5</td>
      <td>2</td>
    </tr>
    <tr>
      <th>2</th>
      <td>3</td>
      <td>24.0</td>
      <td>Male</td>
      <td>1</td>
      <td>58</td>
      <td>6</td>
      <td>2</td>
      <td>6</td>
      <td>2</td>
    </tr>
    <tr>
      <th>3</th>
      <td>4</td>
      <td>22.0</td>
      <td>Female</td>
      <td>1</td>
      <td>51</td>
      <td>2</td>
      <td>3</td>
      <td>6</td>
      <td>5</td>
    </tr>
    <tr>
      <th>4</th>
      <td>5</td>
      <td>19.0</td>
      <td>Female</td>
      <td>0</td>
      <td>49</td>
      <td>7</td>
      <td>6</td>
      <td>5</td>
      <td>2</td>
    </tr>
  </tbody>
</table>
</div>



### Rename a variable

Now that we've loaded our data into Python and have made sure it makes sense, we can start manipulating and cleaning it.

Look back at your dataframe. What is the fifth variable? What does that even mean? Luckily, this is your study and you know that it's a personality questionnaire measuring neuroticism. Let's fix that name and make it more intuitive:


```python
mydata = mydata.rename({'Personality':'Neuroticism'}, axis="columns")
mydata.head()
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>ID</th>
      <th>Age</th>
      <th>Sex</th>
      <th>Condition</th>
      <th>Neuroticism</th>
      <th>T1</th>
      <th>T2</th>
      <th>T3</th>
      <th>T4</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>1</td>
      <td>21.0</td>
      <td>Female</td>
      <td>0</td>
      <td>67</td>
      <td>5</td>
      <td>2</td>
      <td>3</td>
      <td>1</td>
    </tr>
    <tr>
      <th>1</th>
      <td>2</td>
      <td>22.0</td>
      <td>Female</td>
      <td>1</td>
      <td>63</td>
      <td>4</td>
      <td>1</td>
      <td>5</td>
      <td>2</td>
    </tr>
    <tr>
      <th>2</th>
      <td>3</td>
      <td>24.0</td>
      <td>Male</td>
      <td>1</td>
      <td>58</td>
      <td>6</td>
      <td>2</td>
      <td>6</td>
      <td>2</td>
    </tr>
    <tr>
      <th>3</th>
      <td>4</td>
      <td>22.0</td>
      <td>Female</td>
      <td>1</td>
      <td>51</td>
      <td>2</td>
      <td>3</td>
      <td>6</td>
      <td>5</td>
    </tr>
    <tr>
      <th>4</th>
      <td>5</td>
      <td>19.0</td>
      <td>Female</td>
      <td>0</td>
      <td>49</td>
      <td>7</td>
      <td>6</td>
      <td>5</td>
      <td>2</td>
    </tr>
  </tbody>
</table>
</div>



We can also rename multiple variables at once:


```python
mydata = mydata.rename({'T1':'Day1',
                        'T2':'Day2',
                        'T3':'Day3',
                        'T4':'Day4'}, axis="columns")
mydata.head()
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>ID</th>
      <th>Age</th>
      <th>Sex</th>
      <th>Condition</th>
      <th>Neuroticism</th>
      <th>Day1</th>
      <th>Day2</th>
      <th>Day3</th>
      <th>Day4</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>1</td>
      <td>21.0</td>
      <td>Female</td>
      <td>0</td>
      <td>67</td>
      <td>5</td>
      <td>2</td>
      <td>3</td>
      <td>1</td>
    </tr>
    <tr>
      <th>1</th>
      <td>2</td>
      <td>22.0</td>
      <td>Female</td>
      <td>1</td>
      <td>63</td>
      <td>4</td>
      <td>1</td>
      <td>5</td>
      <td>2</td>
    </tr>
    <tr>
      <th>2</th>
      <td>3</td>
      <td>24.0</td>
      <td>Male</td>
      <td>1</td>
      <td>58</td>
      <td>6</td>
      <td>2</td>
      <td>6</td>
      <td>2</td>
    </tr>
    <tr>
      <th>3</th>
      <td>4</td>
      <td>22.0</td>
      <td>Female</td>
      <td>1</td>
      <td>51</td>
      <td>2</td>
      <td>3</td>
      <td>6</td>
      <td>5</td>
    </tr>
    <tr>
      <th>4</th>
      <td>5</td>
      <td>19.0</td>
      <td>Female</td>
      <td>0</td>
      <td>49</td>
      <td>7</td>
      <td>6</td>
      <td>5</td>
      <td>2</td>
    </tr>
  </tbody>
</table>
</div>



### Adding a new column 

Often we'll want to add some new data into a dataframe.


```python
# here we add a column where are the values are the same string
mydata['studyName'] = 'study1'

# here we add a column 'random' of 50 unique random numbers
mydata['random'] = np.random.random(50)

mydata.head()
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>ID</th>
      <th>Age</th>
      <th>Sex</th>
      <th>Condition</th>
      <th>Neuroticism</th>
      <th>Day1</th>
      <th>Day2</th>
      <th>Day3</th>
      <th>Day4</th>
      <th>studyName</th>
      <th>random</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>1</td>
      <td>21.0</td>
      <td>Female</td>
      <td>0</td>
      <td>67</td>
      <td>5</td>
      <td>2</td>
      <td>3</td>
      <td>1</td>
      <td>study1</td>
      <td>0.726704</td>
    </tr>
    <tr>
      <th>1</th>
      <td>2</td>
      <td>22.0</td>
      <td>Female</td>
      <td>1</td>
      <td>63</td>
      <td>4</td>
      <td>1</td>
      <td>5</td>
      <td>2</td>
      <td>study1</td>
      <td>0.118629</td>
    </tr>
    <tr>
      <th>2</th>
      <td>3</td>
      <td>24.0</td>
      <td>Male</td>
      <td>1</td>
      <td>58</td>
      <td>6</td>
      <td>2</td>
      <td>6</td>
      <td>2</td>
      <td>study1</td>
      <td>0.925191</td>
    </tr>
    <tr>
      <th>3</th>
      <td>4</td>
      <td>22.0</td>
      <td>Female</td>
      <td>1</td>
      <td>51</td>
      <td>2</td>
      <td>3</td>
      <td>6</td>
      <td>5</td>
      <td>study1</td>
      <td>0.639571</td>
    </tr>
    <tr>
      <th>4</th>
      <td>5</td>
      <td>19.0</td>
      <td>Female</td>
      <td>0</td>
      <td>49</td>
      <td>7</td>
      <td>6</td>
      <td>5</td>
      <td>2</td>
      <td>study1</td>
      <td>0.579511</td>
    </tr>
  </tbody>
</table>
</div>



For those coming from R, the Python syntax for referencing columns as `df["columnName"]` is roughly equivalent to using R's `$` operator.

### Removing Columns

We can remove columns with the `.drop()` function


```python
mydata = mydata.drop(['random', 'studyName'], axis = 1)
```

## Indexing a Dataframe

Sometimes you might want to look at only a subset of the columns in a dataframe (for example, when there are many variables). Doing this with a `pandas` dataframe is relatively straightforward:


```python
# indexing a single column
ids = mydata[['ID']]
ids.head()
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>ID</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>1</td>
    </tr>
    <tr>
      <th>1</th>
      <td>2</td>
    </tr>
    <tr>
      <th>2</th>
      <td>3</td>
    </tr>
    <tr>
      <th>3</th>
      <td>4</td>
    </tr>
    <tr>
      <th>4</th>
      <td>5</td>
    </tr>
  </tbody>
</table>
</div>




```python
# indexing multiple columns
mydata_subset = mydata[['ID','Age','Neuroticism']]
mydata_subset.head()
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>ID</th>
      <th>Age</th>
      <th>Neuroticism</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>1</td>
      <td>21.0</td>
      <td>67</td>
    </tr>
    <tr>
      <th>1</th>
      <td>2</td>
      <td>22.0</td>
      <td>63</td>
    </tr>
    <tr>
      <th>2</th>
      <td>3</td>
      <td>24.0</td>
      <td>58</td>
    </tr>
    <tr>
      <th>3</th>
      <td>4</td>
      <td>22.0</td>
      <td>51</td>
    </tr>
    <tr>
      <th>4</th>
      <td>5</td>
      <td>19.0</td>
      <td>49</td>
    </tr>
  </tbody>
</table>
</div>



### Using .loc and .iloc to index DataFrames

- If we want to pull out or manipulate specific pieces of dataframes, we can use the `.loc[]` and `.iloc[]` functions.
- With both functions, the data referenced is always formatted as `[selection of rows, selection of columns]`.

#### `.loc[]` takes selections of rows from named columns.

So, here we're asking for elements 0:2 from the `Age` column:


```python
mydata.loc[0:2, ['Age']]
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>Age</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>21.0</td>
    </tr>
    <tr>
      <th>1</th>
      <td>22.0</td>
    </tr>
    <tr>
      <th>2</th>
      <td>24.0</td>
    </tr>
  </tbody>
</table>
</div>



We can also use conditional logic to select rows. Here, we ask for all elements in the `Age` column that are above 24:


```python
mydata.loc[mydata['Age'] > 24, ['Age']]
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>Age</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>5</th>
      <td>25.0</td>
    </tr>
    <tr>
      <th>17</th>
      <td>25.0</td>
    </tr>
    <tr>
      <th>25</th>
      <td>25.0</td>
    </tr>
    <tr>
      <th>27</th>
      <td>25.0</td>
    </tr>
    <tr>
      <th>37</th>
      <td>25.0</td>
    </tr>
  </tbody>
</table>
</div>



#### `.iloc[]` takes selections of rows and columns using numeric indices.


```python
mydata.iloc[3:7, 1:4]
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>Age</th>
      <th>Sex</th>
      <th>Condition</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>3</th>
      <td>22.0</td>
      <td>Female</td>
      <td>1</td>
    </tr>
    <tr>
      <th>4</th>
      <td>19.0</td>
      <td>Female</td>
      <td>0</td>
    </tr>
    <tr>
      <th>5</th>
      <td>25.0</td>
      <td>Female</td>
      <td>1</td>
    </tr>
    <tr>
      <th>6</th>
      <td>24.0</td>
      <td>Female</td>
      <td>1</td>
    </tr>
  </tbody>
</table>
</div>



### Check for missing data
One problem you may have is missing data. Sometimes this is something you already know about, but you should check your data frame anyway to make sure nothing got missed in a data entry error. For small datasets, you can do this visually, but for larger ones you can ask Python.


```python
mydata.isnull()
#mydata.isnull().values.any()
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>ID</th>
      <th>Age</th>
      <th>Sex</th>
      <th>Condition</th>
      <th>Neuroticism</th>
      <th>Day1</th>
      <th>Day2</th>
      <th>Day3</th>
      <th>Day4</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>False</td>
      <td>False</td>
      <td>False</td>
      <td>False</td>
      <td>False</td>
      <td>False</td>
      <td>False</td>
      <td>False</td>
      <td>False</td>
    </tr>
    <tr>
      <th>1</th>
      <td>False</td>
      <td>False</td>
      <td>False</td>
      <td>False</td>
      <td>False</td>
      <td>False</td>
      <td>False</td>
      <td>False</td>
      <td>False</td>
    </tr>
    <tr>
      <th>2</th>
      <td>False</td>
      <td>False</td>
      <td>False</td>
      <td>False</td>
      <td>False</td>
      <td>False</td>
      <td>False</td>
      <td>False</td>
      <td>False</td>
    </tr>
    <tr>
      <th>3</th>
      <td>False</td>
      <td>False</td>
      <td>False</td>
      <td>False</td>
      <td>False</td>
      <td>False</td>
      <td>False</td>
      <td>False</td>
      <td>False</td>
    </tr>
    <tr>
      <th>4</th>
      <td>False</td>
      <td>False</td>
      <td>False</td>
      <td>False</td>
      <td>False</td>
      <td>False</td>
      <td>False</td>
      <td>False</td>
      <td>False</td>
    </tr>
    <tr>
      <th>5</th>
      <td>False</td>
      <td>False</td>
      <td>False</td>
      <td>False</td>
      <td>False</td>
      <td>False</td>
      <td>False</td>
      <td>False</td>
      <td>False</td>
    </tr>
    <tr>
      <th>6</th>
      <td>False</td>
      <td>False</td>
      <td>False</td>
      <td>False</td>
      <td>False</td>
      <td>False</td>
      <td>False</td>
      <td>False</td>
      <td>False</td>
    </tr>
    <tr>
      <th>7</th>
      <td>False</td>
      <td>False</td>
      <td>False</td>
      <td>False</td>
      <td>False</td>
      <td>False</td>
      <td>False</td>
      <td>False</td>
      <td>False</td>
    </tr>
    <tr>
      <th>8</th>
      <td>False</td>
      <td>False</td>
      <td>False</td>
      <td>False</td>
      <td>False</td>
      <td>False</td>
      <td>False</td>
      <td>False</td>
      <td>False</td>
    </tr>
    <tr>
      <th>9</th>
      <td>False</td>
      <td>False</td>
      <td>False</td>
      <td>False</td>
      <td>False</td>
      <td>False</td>
      <td>False</td>
      <td>False</td>
      <td>False</td>
    </tr>
    <tr>
      <th>10</th>
      <td>False</td>
      <td>False</td>
      <td>False</td>
      <td>False</td>
      <td>False</td>
      <td>False</td>
      <td>False</td>
      <td>False</td>
      <td>False</td>
    </tr>
    <tr>
      <th>11</th>
      <td>False</td>
      <td>False</td>
      <td>False</td>
      <td>False</td>
      <td>False</td>
      <td>False</td>
      <td>False</td>
      <td>False</td>
      <td>False</td>
    </tr>
    <tr>
      <th>12</th>
      <td>False</td>
      <td>False</td>
      <td>False</td>
      <td>False</td>
      <td>False</td>
      <td>False</td>
      <td>False</td>
      <td>False</td>
      <td>False</td>
    </tr>
    <tr>
      <th>13</th>
      <td>False</td>
      <td>False</td>
      <td>False</td>
      <td>False</td>
      <td>False</td>
      <td>False</td>
      <td>False</td>
      <td>False</td>
      <td>False</td>
    </tr>
    <tr>
      <th>14</th>
      <td>False</td>
      <td>False</td>
      <td>False</td>
      <td>False</td>
      <td>False</td>
      <td>False</td>
      <td>False</td>
      <td>False</td>
      <td>False</td>
    </tr>
    <tr>
      <th>15</th>
      <td>False</td>
      <td>False</td>
      <td>False</td>
      <td>False</td>
      <td>False</td>
      <td>False</td>
      <td>False</td>
      <td>False</td>
      <td>False</td>
    </tr>
    <tr>
      <th>16</th>
      <td>False</td>
      <td>False</td>
      <td>False</td>
      <td>False</td>
      <td>False</td>
      <td>False</td>
      <td>False</td>
      <td>False</td>
      <td>False</td>
    </tr>
    <tr>
      <th>17</th>
      <td>False</td>
      <td>False</td>
      <td>False</td>
      <td>False</td>
      <td>False</td>
      <td>False</td>
      <td>False</td>
      <td>False</td>
      <td>False</td>
    </tr>
    <tr>
      <th>18</th>
      <td>False</td>
      <td>False</td>
      <td>False</td>
      <td>False</td>
      <td>False</td>
      <td>False</td>
      <td>False</td>
      <td>False</td>
      <td>False</td>
    </tr>
    <tr>
      <th>19</th>
      <td>False</td>
      <td>False</td>
      <td>False</td>
      <td>False</td>
      <td>False</td>
      <td>False</td>
      <td>False</td>
      <td>False</td>
      <td>False</td>
    </tr>
    <tr>
      <th>20</th>
      <td>False</td>
      <td>False</td>
      <td>False</td>
      <td>False</td>
      <td>False</td>
      <td>False</td>
      <td>False</td>
      <td>False</td>
      <td>False</td>
    </tr>
    <tr>
      <th>21</th>
      <td>False</td>
      <td>False</td>
      <td>False</td>
      <td>False</td>
      <td>False</td>
      <td>False</td>
      <td>False</td>
      <td>False</td>
      <td>False</td>
    </tr>
    <tr>
      <th>22</th>
      <td>False</td>
      <td>False</td>
      <td>False</td>
      <td>False</td>
      <td>False</td>
      <td>False</td>
      <td>False</td>
      <td>False</td>
      <td>False</td>
    </tr>
    <tr>
      <th>23</th>
      <td>False</td>
      <td>False</td>
      <td>False</td>
      <td>False</td>
      <td>False</td>
      <td>False</td>
      <td>False</td>
      <td>False</td>
      <td>False</td>
    </tr>
    <tr>
      <th>24</th>
      <td>False</td>
      <td>False</td>
      <td>False</td>
      <td>False</td>
      <td>False</td>
      <td>False</td>
      <td>False</td>
      <td>False</td>
      <td>False</td>
    </tr>
    <tr>
      <th>25</th>
      <td>False</td>
      <td>False</td>
      <td>False</td>
      <td>False</td>
      <td>False</td>
      <td>False</td>
      <td>False</td>
      <td>False</td>
      <td>False</td>
    </tr>
    <tr>
      <th>26</th>
      <td>False</td>
      <td>False</td>
      <td>False</td>
      <td>False</td>
      <td>False</td>
      <td>False</td>
      <td>False</td>
      <td>False</td>
      <td>False</td>
    </tr>
    <tr>
      <th>27</th>
      <td>False</td>
      <td>False</td>
      <td>False</td>
      <td>False</td>
      <td>False</td>
      <td>False</td>
      <td>False</td>
      <td>False</td>
      <td>False</td>
    </tr>
    <tr>
      <th>28</th>
      <td>False</td>
      <td>False</td>
      <td>False</td>
      <td>False</td>
      <td>False</td>
      <td>False</td>
      <td>False</td>
      <td>False</td>
      <td>False</td>
    </tr>
    <tr>
      <th>29</th>
      <td>False</td>
      <td>False</td>
      <td>False</td>
      <td>False</td>
      <td>False</td>
      <td>False</td>
      <td>False</td>
      <td>False</td>
      <td>False</td>
    </tr>
    <tr>
      <th>30</th>
      <td>False</td>
      <td>False</td>
      <td>False</td>
      <td>False</td>
      <td>False</td>
      <td>False</td>
      <td>False</td>
      <td>False</td>
      <td>False</td>
    </tr>
    <tr>
      <th>31</th>
      <td>False</td>
      <td>False</td>
      <td>False</td>
      <td>False</td>
      <td>False</td>
      <td>False</td>
      <td>False</td>
      <td>False</td>
      <td>False</td>
    </tr>
    <tr>
      <th>32</th>
      <td>False</td>
      <td>False</td>
      <td>False</td>
      <td>False</td>
      <td>False</td>
      <td>False</td>
      <td>False</td>
      <td>False</td>
      <td>False</td>
    </tr>
    <tr>
      <th>33</th>
      <td>False</td>
      <td>False</td>
      <td>False</td>
      <td>False</td>
      <td>False</td>
      <td>False</td>
      <td>False</td>
      <td>False</td>
      <td>False</td>
    </tr>
    <tr>
      <th>34</th>
      <td>False</td>
      <td>False</td>
      <td>False</td>
      <td>False</td>
      <td>False</td>
      <td>False</td>
      <td>False</td>
      <td>False</td>
      <td>False</td>
    </tr>
    <tr>
      <th>35</th>
      <td>False</td>
      <td>False</td>
      <td>False</td>
      <td>False</td>
      <td>False</td>
      <td>False</td>
      <td>False</td>
      <td>False</td>
      <td>False</td>
    </tr>
    <tr>
      <th>36</th>
      <td>False</td>
      <td>False</td>
      <td>False</td>
      <td>False</td>
      <td>False</td>
      <td>False</td>
      <td>False</td>
      <td>False</td>
      <td>False</td>
    </tr>
    <tr>
      <th>37</th>
      <td>False</td>
      <td>False</td>
      <td>False</td>
      <td>False</td>
      <td>False</td>
      <td>False</td>
      <td>False</td>
      <td>False</td>
      <td>False</td>
    </tr>
    <tr>
      <th>38</th>
      <td>False</td>
      <td>True</td>
      <td>False</td>
      <td>False</td>
      <td>False</td>
      <td>False</td>
      <td>False</td>
      <td>False</td>
      <td>False</td>
    </tr>
    <tr>
      <th>39</th>
      <td>False</td>
      <td>False</td>
      <td>False</td>
      <td>False</td>
      <td>False</td>
      <td>False</td>
      <td>False</td>
      <td>False</td>
      <td>False</td>
    </tr>
    <tr>
      <th>40</th>
      <td>False</td>
      <td>False</td>
      <td>False</td>
      <td>False</td>
      <td>False</td>
      <td>False</td>
      <td>False</td>
      <td>False</td>
      <td>False</td>
    </tr>
    <tr>
      <th>41</th>
      <td>False</td>
      <td>False</td>
      <td>False</td>
      <td>False</td>
      <td>False</td>
      <td>False</td>
      <td>False</td>
      <td>False</td>
      <td>False</td>
    </tr>
    <tr>
      <th>42</th>
      <td>False</td>
      <td>False</td>
      <td>False</td>
      <td>False</td>
      <td>False</td>
      <td>False</td>
      <td>False</td>
      <td>False</td>
      <td>False</td>
    </tr>
    <tr>
      <th>43</th>
      <td>False</td>
      <td>False</td>
      <td>False</td>
      <td>False</td>
      <td>False</td>
      <td>False</td>
      <td>False</td>
      <td>False</td>
      <td>False</td>
    </tr>
    <tr>
      <th>44</th>
      <td>False</td>
      <td>False</td>
      <td>False</td>
      <td>False</td>
      <td>False</td>
      <td>False</td>
      <td>False</td>
      <td>False</td>
      <td>False</td>
    </tr>
    <tr>
      <th>45</th>
      <td>False</td>
      <td>False</td>
      <td>False</td>
      <td>False</td>
      <td>False</td>
      <td>False</td>
      <td>False</td>
      <td>False</td>
      <td>False</td>
    </tr>
    <tr>
      <th>46</th>
      <td>False</td>
      <td>False</td>
      <td>False</td>
      <td>False</td>
      <td>False</td>
      <td>False</td>
      <td>False</td>
      <td>False</td>
      <td>False</td>
    </tr>
    <tr>
      <th>47</th>
      <td>False</td>
      <td>False</td>
      <td>False</td>
      <td>False</td>
      <td>False</td>
      <td>False</td>
      <td>False</td>
      <td>False</td>
      <td>False</td>
    </tr>
    <tr>
      <th>48</th>
      <td>False</td>
      <td>False</td>
      <td>False</td>
      <td>False</td>
      <td>False</td>
      <td>False</td>
      <td>False</td>
      <td>False</td>
      <td>False</td>
    </tr>
    <tr>
      <th>49</th>
      <td>False</td>
      <td>False</td>
      <td>False</td>
      <td>False</td>
      <td>False</td>
      <td>False</td>
      <td>False</td>
      <td>False</td>
      <td>False</td>
    </tr>
  </tbody>
</table>
</div>



In this case, the missing value is the `Age` value in row 38. You know you have this info somewhere on a paper form, so you go dig it up and want to replace it.



```python
# Verify that this row contains the missing data
mydata.loc[mydata["ID"]==39]
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>ID</th>
      <th>Age</th>
      <th>Sex</th>
      <th>Condition</th>
      <th>Neuroticism</th>
      <th>Day1</th>
      <th>Day2</th>
      <th>Day3</th>
      <th>Day4</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>38</th>
      <td>39</td>
      <td>NaN</td>
      <td>Female</td>
      <td>1</td>
      <td>53</td>
      <td>1</td>
      <td>3</td>
      <td>1</td>
      <td>3</td>
    </tr>
  </tbody>
</table>
</div>




```python
# Replace row, column with the value 30
mydata.loc[mydata["ID"]==39, "Age"] = 30
```


```python
# Verify that the replacement worked
mydata.loc[mydata["ID"]==39]
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>ID</th>
      <th>Age</th>
      <th>Sex</th>
      <th>Condition</th>
      <th>Neuroticism</th>
      <th>Day1</th>
      <th>Day2</th>
      <th>Day3</th>
      <th>Day4</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>38</th>
      <td>39</td>
      <td>30.0</td>
      <td>Female</td>
      <td>1</td>
      <td>53</td>
      <td>1</td>
      <td>3</td>
      <td>1</td>
      <td>3</td>
    </tr>
  </tbody>
</table>
</div>



### Check for correct values

Let's take a look at the `Sex` variable:


```python
mydata['Sex'].head()
```




    0    Female
    1    Female
    2      Male
    3    Female
    4    Female
    Name: Sex, dtype: object



It looks like there are two categories here, but let's double check. We can use the `unique()` function to list all of the unique values in a column:


```python
mydata["Sex"].unique()
```




    array(['Female', 'Male', 'Femle'], dtype=object)



Here we see another data entry problem. At least one of the rows has a third category label that should really be another case of "Female". Let's replace this label using the `replace()` function:


```python
mydata["Sex"] = mydata["Sex"].replace('Femle', 'Female')
```


```python
# Verify that the replacement worked
mydata["Sex"].unique()
```




    array(['Female', 'Male'], dtype=object)



Now let's look at some of the continuous variables. You can also look at these by indexing them individually, but sometimes it's easier to visualize. The `hist()` function, which creates histograms, is good here.


```python
mydata["Age"].hist();
```


![png](output_75_0.png)



```python
mydata["Neuroticism"].hist();
```


![png](output_76_0.png)


Looks like we have a potential outlier on the `Neuroticism` score. This could be an entry error, but it could also be a real value that just happens to be really low. This is why data inspection is so important for later analysis — now that you know that the value is there, it's up to you to decide how to deal with it.

### Filtering data 
Let's say we have decided a prori to exclude outliers 3SD above or below the mean. We will first define these boundaries:


```python
upper = np.mean(mydata["Neuroticism"]) + 3*np.std(mydata["Neuroticism"])
lower = np.mean(mydata["Neuroticism"]) - 3*np.std(mydata["Neuroticism"])
```

We can now use conditional indexing to exclude all rows with a `Neuroticism` score above or below these values:


```python
mydata = mydata[(mydata["Neuroticism"] > lower) & (mydata["Neuroticism"] < upper)]
```

The line above says: return only the `Neuroticism` values greater than the `lower` boundary and less than the `upper` boundary and then save it in the `mydata` variable.


```python
# Verify that we excluded 1 outlier
mydata.shape
```




    (49, 9)




```python
mydata["Neuroticism"].hist();
```


![png](output_84_0.png)


---
## Getting Ready for Analysis

Now that we've gone through and cleaned up the problems, you can think ahead to how you'll want to use this data.

### Recoding variables

Sometimes we want to treat categorical variables as factors, but sometimes we want to pretend they're numeric (as in a regression, when binary variables can be coded as 0 and 1). Right now, `Condition` is coded as a binary numeric variable, but that's not very informative, so you'd rather have the values be descriptive. Here, the function `replace()` is again useful:


```python
mydata['ConditionF'] = mydata['Condition'].replace([0,1], ['Control','Treatment'])
```


```python
# Verify that your variable is now recoded as you'd like
mydata[['Condition','ConditionF']].head()
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>Condition</th>
      <th>ConditionF</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>0</td>
      <td>Control</td>
    </tr>
    <tr>
      <th>1</th>
      <td>1</td>
      <td>Treatment</td>
    </tr>
    <tr>
      <th>2</th>
      <td>1</td>
      <td>Treatment</td>
    </tr>
    <tr>
      <th>3</th>
      <td>1</td>
      <td>Treatment</td>
    </tr>
    <tr>
      <th>4</th>
      <td>0</td>
      <td>Control</td>
    </tr>
  </tbody>
</table>
</div>



### Calculating new variables

You may also want to recalculate or rescale some variables. For example, we can turn `Neuroticism` into a *z*-score, or calculate an average response across the four time points.

To compute a *z*-score, we can use the `zscore()` function from the `scipy.stats` module:


```python
from scipy.stats import zscore

mydata['NeuroticismZ'] = zscore(mydata['Neuroticism'])
```


```python
mydata['NeuroticismZ'].hist();
```


![png](output_90_0.png)


To calculate the means across each day, we can use the `mean()` function from `pandas` on a dataframe that has been indexed to include only data from the four days:


```python
mydata['DayMean'] = mydata[['Day1','Day2','Day3','Day4']].mean(axis="columns")
```


```python
mydata['DayMean'].hist();
```


![png](output_93_0.png)


### Combining data from multiple sources

Sometimes, data might be spread across multiple files, and you'll want to combine those for your analysis. For example, maybe this study had a follow-up survey on Day 30. Scores from that survey were entered into another spreadsheet, which only has the subject ID and that score. We want to include that score into our data.


```python
# first load the followup dataset
mydata2 = pd.read_csv("Study1_Followup.csv")
```

We can use the function `merge()` to combine the two dataframes. To make sure the data matches up, we use the `on` argument to specify that IDs should match. That way even if the data is in a different order, scores will match together correctly.


```python
mydata = mydata.merge(mydata2,on="ID")
mydata.head()
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>ID</th>
      <th>Age</th>
      <th>Sex</th>
      <th>Condition</th>
      <th>Neuroticism</th>
      <th>Day1</th>
      <th>Day2</th>
      <th>Day3</th>
      <th>Day4</th>
      <th>ConditionF</th>
      <th>NeuroticismZ</th>
      <th>DayMean</th>
      <th>Day30</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>1</td>
      <td>21.0</td>
      <td>Female</td>
      <td>0</td>
      <td>67</td>
      <td>5</td>
      <td>2</td>
      <td>3</td>
      <td>1</td>
      <td>Control</td>
      <td>0.754583</td>
      <td>2.75</td>
      <td>6</td>
    </tr>
    <tr>
      <th>1</th>
      <td>2</td>
      <td>22.0</td>
      <td>Female</td>
      <td>1</td>
      <td>63</td>
      <td>4</td>
      <td>1</td>
      <td>5</td>
      <td>2</td>
      <td>Treatment</td>
      <td>0.418450</td>
      <td>3.00</td>
      <td>6</td>
    </tr>
    <tr>
      <th>2</th>
      <td>3</td>
      <td>24.0</td>
      <td>Male</td>
      <td>1</td>
      <td>58</td>
      <td>6</td>
      <td>2</td>
      <td>6</td>
      <td>2</td>
      <td>Treatment</td>
      <td>-0.001715</td>
      <td>4.00</td>
      <td>6</td>
    </tr>
    <tr>
      <th>3</th>
      <td>4</td>
      <td>22.0</td>
      <td>Female</td>
      <td>1</td>
      <td>51</td>
      <td>2</td>
      <td>3</td>
      <td>6</td>
      <td>5</td>
      <td>Treatment</td>
      <td>-0.589946</td>
      <td>4.00</td>
      <td>3</td>
    </tr>
    <tr>
      <th>4</th>
      <td>5</td>
      <td>19.0</td>
      <td>Female</td>
      <td>0</td>
      <td>49</td>
      <td>7</td>
      <td>6</td>
      <td>5</td>
      <td>2</td>
      <td>Control</td>
      <td>-0.758013</td>
      <td>5.00</td>
      <td>6</td>
    </tr>
  </tbody>
</table>
</div>



### Shaping data

Finally, you may want to change the layout of your data. Right now, our dataframe is in "wide" format, which means that each row is a subject, and each observation gets its own column. For some analyses, you'll need to use "long" format, where each row is an observation, and columns specify things like `Time` and `ID` to differentiate the observations. For this, we can use the `melt()` function in `pandas`:


```python
value_cols = ["Day1","Day2","Day3","Day4"] # columns we would like to convert to a single "long" column
id_cols = list(mydata.columns) # columns we would like to stay in the same "wide" format
for i in value_cols:
    id_cols.remove(i)
```

#### Wide → Long


```python
mydata_Long = pd.melt(mydata,id_vars=id_cols,var_name="Time",value_vars=value_cols,value_name="Score")
mydata_Long.head()
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>ID</th>
      <th>Age</th>
      <th>Sex</th>
      <th>Condition</th>
      <th>Neuroticism</th>
      <th>ConditionF</th>
      <th>NeuroticismZ</th>
      <th>DayMean</th>
      <th>Day30</th>
      <th>Time</th>
      <th>Score</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>1</td>
      <td>21.0</td>
      <td>Female</td>
      <td>0</td>
      <td>67</td>
      <td>Control</td>
      <td>0.754583</td>
      <td>2.75</td>
      <td>6</td>
      <td>Day1</td>
      <td>5</td>
    </tr>
    <tr>
      <th>1</th>
      <td>2</td>
      <td>22.0</td>
      <td>Female</td>
      <td>1</td>
      <td>63</td>
      <td>Treatment</td>
      <td>0.418450</td>
      <td>3.00</td>
      <td>6</td>
      <td>Day1</td>
      <td>4</td>
    </tr>
    <tr>
      <th>2</th>
      <td>3</td>
      <td>24.0</td>
      <td>Male</td>
      <td>1</td>
      <td>58</td>
      <td>Treatment</td>
      <td>-0.001715</td>
      <td>4.00</td>
      <td>6</td>
      <td>Day1</td>
      <td>6</td>
    </tr>
    <tr>
      <th>3</th>
      <td>4</td>
      <td>22.0</td>
      <td>Female</td>
      <td>1</td>
      <td>51</td>
      <td>Treatment</td>
      <td>-0.589946</td>
      <td>4.00</td>
      <td>3</td>
      <td>Day1</td>
      <td>2</td>
    </tr>
    <tr>
      <th>4</th>
      <td>5</td>
      <td>19.0</td>
      <td>Female</td>
      <td>0</td>
      <td>49</td>
      <td>Control</td>
      <td>-0.758013</td>
      <td>5.00</td>
      <td>6</td>
      <td>Day1</td>
      <td>7</td>
    </tr>
  </tbody>
</table>
</div>



#### Long → Wide
We can go back in the other direction by using the `pivot_table()` function in `pandas`:


```python
mydata_Wide = mydata_Long.pivot_table(values="Score", index=id_cols, columns='Time').reset_index()
mydata_Wide.columns.name = None
mydata_Wide.head()
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>ID</th>
      <th>Age</th>
      <th>Sex</th>
      <th>Condition</th>
      <th>Neuroticism</th>
      <th>ConditionF</th>
      <th>NeuroticismZ</th>
      <th>DayMean</th>
      <th>Day30</th>
      <th>Day1</th>
      <th>Day2</th>
      <th>Day3</th>
      <th>Day4</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>1</td>
      <td>21.0</td>
      <td>Female</td>
      <td>0</td>
      <td>67</td>
      <td>Control</td>
      <td>0.754583</td>
      <td>2.75</td>
      <td>6</td>
      <td>5</td>
      <td>2</td>
      <td>3</td>
      <td>1</td>
    </tr>
    <tr>
      <th>1</th>
      <td>2</td>
      <td>22.0</td>
      <td>Female</td>
      <td>1</td>
      <td>63</td>
      <td>Treatment</td>
      <td>0.418450</td>
      <td>3.00</td>
      <td>6</td>
      <td>4</td>
      <td>1</td>
      <td>5</td>
      <td>2</td>
    </tr>
    <tr>
      <th>2</th>
      <td>3</td>
      <td>24.0</td>
      <td>Male</td>
      <td>1</td>
      <td>58</td>
      <td>Treatment</td>
      <td>-0.001715</td>
      <td>4.00</td>
      <td>6</td>
      <td>6</td>
      <td>2</td>
      <td>6</td>
      <td>2</td>
    </tr>
    <tr>
      <th>3</th>
      <td>4</td>
      <td>22.0</td>
      <td>Female</td>
      <td>1</td>
      <td>51</td>
      <td>Treatment</td>
      <td>-0.589946</td>
      <td>4.00</td>
      <td>3</td>
      <td>2</td>
      <td>3</td>
      <td>6</td>
      <td>5</td>
    </tr>
    <tr>
      <th>4</th>
      <td>5</td>
      <td>19.0</td>
      <td>Female</td>
      <td>0</td>
      <td>49</td>
      <td>Control</td>
      <td>-0.758013</td>
      <td>5.00</td>
      <td>6</td>
      <td>7</td>
      <td>6</td>
      <td>5</td>
      <td>2</td>
    </tr>
  </tbody>
</table>
</div>



---
## Saving Your Work

Once you've created a data cleaning script like this one, you'll have a record of all the edits you've made on the raw data, and you can recreate your cleaned data just by running the script again. However, it's often easier to save your cleaned data as its own file **(never overwrite the raw data)**, so when you come back to do analysis you don't have to bother with all the cleaning steps. 

You can always save data frames as a .csv for easy sharing and viewing outside of Python.


```python
# write data to a .csv
mydata.to_csv("Study1_clean.csv",index = False)
```

---
## Future Directions

Congratulations! You've now cleaned some data in Python and you're ready to start working with your data. This tutorial only went over some basic cleaning steps. As you work with your own data, you may find yourself needing other tools. 


**Next:** [Data Manipulation in Python](/tutorials/python/3-datamanipulation/)

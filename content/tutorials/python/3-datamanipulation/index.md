---
title: "Data Manipulation in Python"
subtitle: "CU Psych Scientific Computing Workshop"
weight: 1301
tags: ["core", "python"]

---

## Goals of this Lesson

### Students will learn:

1. How to group and categorize data in Python
2. How to generative descriptive statistics in Python

## Links to Files
The files for all tutorials can be downloaded from [the Columbia Psychology Scientific Computing GitHub page](https://github.com/cu-psych-computing/cu-psych-comp-tutorial) using [these instructions](/accessing-files/). This particular file is located here: `/content/tutorials/python/3-datamanipulation/index.ipynb`.

---


```python
# load packages we will be using for this lesson
import pandas as pd
```

---
## Open Dataset and Load Package

This dataset examines the relationship between multitasking and working memory. [Link here to original paper by Uncapher et al. 2016.](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC4733435/pdf/nihms712443.pdf)



```python
# use pd.read_csv to open data into python
df = pd.read_csv("uncapher_2016_repeated_measures_dataset.csv")
```

---
## Familiarize Yourself with the Data


Quick review from [Data Cleaning](/tutorials/python/2-datacleaning/): take a look at the basic data structure, number of rows and columns.



```python
df.head()
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
      <th>subjNum</th>
      <th>groupStatus</th>
      <th>numDist</th>
      <th>conf</th>
      <th>hitCount</th>
      <th>allOldCount</th>
      <th>rtHit</th>
      <th>faCount</th>
      <th>allNewCount</th>
      <th>rtFA</th>
      <th>distPresent</th>
      <th>hitRate</th>
      <th>faRate</th>
      <th>dprime</th>
      <th>mmi</th>
      <th>adhd</th>
      <th>bis</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>6</td>
      <td>HMM</td>
      <td>0</td>
      <td>hi</td>
      <td>18</td>
      <td>25</td>
      <td>0.990657</td>
      <td>3</td>
      <td>50</td>
      <td>1.062458</td>
      <td>nodist</td>
      <td>0.711538</td>
      <td>0.068627</td>
      <td>2.043976</td>
      <td>5.77</td>
      <td>4</td>
      <td>74</td>
    </tr>
    <tr>
      <th>1</th>
      <td>6</td>
      <td>HMM</td>
      <td>6</td>
      <td>hi</td>
      <td>14</td>
      <td>25</td>
      <td>0.951638</td>
      <td>3</td>
      <td>50</td>
      <td>1.062458</td>
      <td>dist</td>
      <td>0.557692</td>
      <td>0.068627</td>
      <td>1.631213</td>
      <td>5.77</td>
      <td>4</td>
      <td>74</td>
    </tr>
    <tr>
      <th>2</th>
      <td>10</td>
      <td>HMM</td>
      <td>0</td>
      <td>hi</td>
      <td>5</td>
      <td>25</td>
      <td>1.081535</td>
      <td>8</td>
      <td>50</td>
      <td>1.036764</td>
      <td>nodist</td>
      <td>0.211538</td>
      <td>0.166667</td>
      <td>0.166327</td>
      <td>6.21</td>
      <td>4</td>
      <td>51</td>
    </tr>
    <tr>
      <th>3</th>
      <td>10</td>
      <td>HMM</td>
      <td>6</td>
      <td>hi</td>
      <td>5</td>
      <td>25</td>
      <td>0.999527</td>
      <td>8</td>
      <td>50</td>
      <td>1.036764</td>
      <td>dist</td>
      <td>0.211538</td>
      <td>0.166667</td>
      <td>0.166327</td>
      <td>6.21</td>
      <td>4</td>
      <td>51</td>
    </tr>
    <tr>
      <th>4</th>
      <td>14</td>
      <td>HMM</td>
      <td>0</td>
      <td>hi</td>
      <td>3</td>
      <td>25</td>
      <td>2.346210</td>
      <td>4</td>
      <td>50</td>
      <td>2.075087</td>
      <td>nodist</td>
      <td>0.134615</td>
      <td>0.088235</td>
      <td>0.246866</td>
      <td>8.60</td>
      <td>5</td>
      <td>62</td>
    </tr>
  </tbody>
</table>
</div>




```python
df.shape
```




    (136, 17)




```python
df.columns
```




    Index(['subjNum', 'groupStatus', 'numDist', 'conf', 'hitCount', 'allOldCount',
           'rtHit', 'faCount', 'allNewCount', 'rtFA', 'distPresent', 'hitRate',
           'faRate', 'dprime', 'mmi', 'adhd', 'bis'],
          dtype='object')



---
## Selecting Relevant Variables

Sometimes datasets have many variables that are unnecessary for a given analysis. To simplify your life, and your code, we can select only the given variables we'd like to use for now.



```python
df = df[["subjNum", "groupStatus", "adhd", "hitRate", "faRate", "dprime"]]
df.head()
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
      <th>subjNum</th>
      <th>groupStatus</th>
      <th>adhd</th>
      <th>hitRate</th>
      <th>faRate</th>
      <th>dprime</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>6</td>
      <td>HMM</td>
      <td>4</td>
      <td>0.711538</td>
      <td>0.068627</td>
      <td>2.043976</td>
    </tr>
    <tr>
      <th>1</th>
      <td>6</td>
      <td>HMM</td>
      <td>4</td>
      <td>0.557692</td>
      <td>0.068627</td>
      <td>1.631213</td>
    </tr>
    <tr>
      <th>2</th>
      <td>10</td>
      <td>HMM</td>
      <td>4</td>
      <td>0.211538</td>
      <td>0.166667</td>
      <td>0.166327</td>
    </tr>
    <tr>
      <th>3</th>
      <td>10</td>
      <td>HMM</td>
      <td>4</td>
      <td>0.211538</td>
      <td>0.166667</td>
      <td>0.166327</td>
    </tr>
    <tr>
      <th>4</th>
      <td>14</td>
      <td>HMM</td>
      <td>5</td>
      <td>0.134615</td>
      <td>0.088235</td>
      <td>0.246866</td>
    </tr>
  </tbody>
</table>
</div>



---
## Basic Descriptives
### Summarizing data
Let's learn how to make simple tables of summary statistics.
First, we will calculate summary info across all data using `describe()`, a useful function for creating summaries. Note that we're not creating a new object for this summary (i.e. not using the `=` symbol), so this will print but not save.



```python
df.describe()
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
      <th>subjNum</th>
      <th>adhd</th>
      <th>hitRate</th>
      <th>faRate</th>
      <th>dprime</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>count</th>
      <td>136.000000</td>
      <td>136.000000</td>
      <td>136.000000</td>
      <td>136.000000</td>
      <td>136.000000</td>
    </tr>
    <tr>
      <th>mean</th>
      <td>72.676471</td>
      <td>2.382353</td>
      <td>0.350679</td>
      <td>0.081603</td>
      <td>1.133846</td>
    </tr>
    <tr>
      <th>std</th>
      <td>41.664779</td>
      <td>1.651302</td>
      <td>0.153422</td>
      <td>0.073607</td>
      <td>0.566277</td>
    </tr>
    <tr>
      <th>min</th>
      <td>2.000000</td>
      <td>0.000000</td>
      <td>0.057692</td>
      <td>0.009804</td>
      <td>0.047920</td>
    </tr>
    <tr>
      <th>25%</th>
      <td>38.500000</td>
      <td>1.000000</td>
      <td>0.250000</td>
      <td>0.029412</td>
      <td>0.712359</td>
    </tr>
    <tr>
      <th>50%</th>
      <td>73.000000</td>
      <td>2.000000</td>
      <td>0.326923</td>
      <td>0.058824</td>
      <td>1.094755</td>
    </tr>
    <tr>
      <th>75%</th>
      <td>108.500000</td>
      <td>4.000000</td>
      <td>0.442308</td>
      <td>0.107843</td>
      <td>1.545407</td>
    </tr>
    <tr>
      <th>max</th>
      <td>142.000000</td>
      <td>5.000000</td>
      <td>0.788462</td>
      <td>0.362745</td>
      <td>2.478890</td>
    </tr>
  </tbody>
</table>
</div>



---
## Grouping Data
Next, we will learn how to group data based on certain variables of interest.

We will use the `groupby()` function in `pandas`, which will automatically group any subsequent actions called on the data. 


```python
df.groupby(["groupStatus"]).mean()
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
      <th>subjNum</th>
      <th>adhd</th>
      <th>hitRate</th>
      <th>faRate</th>
      <th>dprime</th>
    </tr>
    <tr>
      <th>groupStatus</th>
      <th></th>
      <th></th>
      <th></th>
      <th></th>
      <th></th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>HMM</th>
      <td>74.852941</td>
      <td>2.941176</td>
      <td>0.345023</td>
      <td>0.088235</td>
      <td>1.032845</td>
    </tr>
    <tr>
      <th>LMM</th>
      <td>70.500000</td>
      <td>1.823529</td>
      <td>0.356335</td>
      <td>0.074971</td>
      <td>1.234847</td>
    </tr>
  </tbody>
</table>
</div>



We can group data by more than one factor. Let's say we're interested in how levels of `adhd` interact with `groupStatus` (multitasking: high or low). 

We will first make a factor for `adhd` (median-split), and add it as a grouping variable using the `cut()` function in `pandas`:



```python
df["adhdF"] = pd.cut(df["adhd"],bins=2,labels=["Low","High"])
```

Then we'll check how evenly split these groups are by using `groupby()` the `size()` functions:


```python
df.groupby(["groupStatus","adhdF"]).size()
```




    groupStatus  adhdF
    HMM          Low      24
                 High     44
    LMM          Low      46
                 High     22
    dtype: int64



Then we'll calculate some summary info about these groups:


```python
df.groupby(["groupStatus","adhdF"]).mean()
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
      <th></th>
      <th>subjNum</th>
      <th>adhd</th>
      <th>hitRate</th>
      <th>faRate</th>
      <th>dprime</th>
    </tr>
    <tr>
      <th>groupStatus</th>
      <th>adhdF</th>
      <th></th>
      <th></th>
      <th></th>
      <th></th>
      <th></th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th rowspan="2" valign="top">HMM</th>
      <th>Low</th>
      <td>82.500000</td>
      <td>1.083333</td>
      <td>0.286859</td>
      <td>0.084967</td>
      <td>0.818802</td>
    </tr>
    <tr>
      <th>High</th>
      <td>70.681818</td>
      <td>3.954545</td>
      <td>0.376748</td>
      <td>0.090018</td>
      <td>1.149595</td>
    </tr>
    <tr>
      <th rowspan="2" valign="top">LMM</th>
      <th>Low</th>
      <td>72.478261</td>
      <td>0.913043</td>
      <td>0.388796</td>
      <td>0.078005</td>
      <td>1.302366</td>
    </tr>
    <tr>
      <th>High</th>
      <td>66.363636</td>
      <td>3.727273</td>
      <td>0.288462</td>
      <td>0.068627</td>
      <td>1.093670</td>
    </tr>
  </tbody>
</table>
</div>



### A note on piping / stringing commands together

In R, we often use the pipe `%>%` to string a series of steps together. We can do the same in Python with many functions in a row.

This is how we're able to take the output of `df.groupby(["groupStatus","adhdF"])` and then *send that output* into the `mean()` function

---
## Extra: Working with a Long Dataset 


This is a repeated measures ("long") dataset, with multiple rows per subject. This makes things a bit tricker, but we are going to show you some tools for how to work with "long" datasets.

### How many unique subjects are in the data?


```python
subList = df["subjNum"].unique()
nSubs = len(subList)
nSubs
```




    68



### How many trials were there per subject?



```python
nTrialsPerSubj = df.groupby(["subjNum"]).size().reset_index(name="nTrials")
nTrialsPerSubj.head()
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
      <th>subjNum</th>
      <th>nTrials</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>2</td>
      <td>2</td>
    </tr>
    <tr>
      <th>1</th>
      <td>5</td>
      <td>2</td>
    </tr>
    <tr>
      <th>2</th>
      <td>6</td>
      <td>2</td>
    </tr>
    <tr>
      <th>3</th>
      <td>9</td>
      <td>2</td>
    </tr>
    <tr>
      <th>4</th>
      <td>10</td>
      <td>2</td>
    </tr>
  </tbody>
</table>
</div>



### Combine summary statistics with the full dataframe

For some analyses, you might want to add a higher level variable (e.g., subject average `hitRate`) alongside your long data. We can do this by summarizing the data in a new dataframe and then merging it with the full data.


```python
avgHR = df.groupby(["subjNum"])["hitRate"].mean().reset_index(name="avgHR")
avgHR.head()
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
      <th>subjNum</th>
      <th>avgHR</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>2</td>
      <td>0.326923</td>
    </tr>
    <tr>
      <th>1</th>
      <td>5</td>
      <td>0.403846</td>
    </tr>
    <tr>
      <th>2</th>
      <td>6</td>
      <td>0.634615</td>
    </tr>
    <tr>
      <th>3</th>
      <td>9</td>
      <td>0.173077</td>
    </tr>
    <tr>
      <th>4</th>
      <td>10</td>
      <td>0.211538</td>
    </tr>
  </tbody>
</table>
</div>




```python
df = df.merge(avgHR,on="subjNum")
df.head()
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
      <th>subjNum</th>
      <th>groupStatus</th>
      <th>adhd</th>
      <th>hitRate</th>
      <th>faRate</th>
      <th>dprime</th>
      <th>adhdF</th>
      <th>avgHR</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>6</td>
      <td>HMM</td>
      <td>4</td>
      <td>0.711538</td>
      <td>0.068627</td>
      <td>2.043976</td>
      <td>High</td>
      <td>0.634615</td>
    </tr>
    <tr>
      <th>1</th>
      <td>6</td>
      <td>HMM</td>
      <td>4</td>
      <td>0.557692</td>
      <td>0.068627</td>
      <td>1.631213</td>
      <td>High</td>
      <td>0.634615</td>
    </tr>
    <tr>
      <th>2</th>
      <td>10</td>
      <td>HMM</td>
      <td>4</td>
      <td>0.211538</td>
      <td>0.166667</td>
      <td>0.166327</td>
      <td>High</td>
      <td>0.211538</td>
    </tr>
    <tr>
      <th>3</th>
      <td>10</td>
      <td>HMM</td>
      <td>4</td>
      <td>0.211538</td>
      <td>0.166667</td>
      <td>0.166327</td>
      <td>High</td>
      <td>0.211538</td>
    </tr>
    <tr>
      <th>4</th>
      <td>14</td>
      <td>HMM</td>
      <td>5</td>
      <td>0.134615</td>
      <td>0.088235</td>
      <td>0.246866</td>
      <td>High</td>
      <td>0.211538</td>
    </tr>
  </tbody>
</table>
</div>



You should now have an `avgHR` column in `df`, which will repeat *within* each subject, but vary *across* subjects.


**Next:** [Plotting in Python](/tutorials/python/4-plotting/)

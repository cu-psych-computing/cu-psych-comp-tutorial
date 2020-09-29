---
title: "Getting Started with Jupyter Notebooks"
subtitle: "CU Psych Scientific Computing Workshop"
weight: 1102
tags: ["core", "python"]

---

## Goals:

- Students will feel comfortable navigating the jupyter notebook layout
- Students will be able to access their computer's file structure through jupyter notebook

## Links to Files and Video Recording

The files for all tutorials can be downloaded from [the Columbia Psychology Scientific Computing GitHub page](https://github.com/cu-psych-computing/cu-psych-comp-tutorial) using [these instructions](/accessing-files/). This particular file is located here: `/content/tutorials/python/1-r2python-translation/1-getting-started.ipynb`.

For a video recording of this tutorial from the Fall 2020 workshop, please visit the <a href="/workshop-recording-session3/" target="_blank">Workshop Recording: Session 3</a> page.


## What is a jupyter notebook anyway?

- Jupyter notebooks are a tool for working in python (and other languages). 
- They allow you to create and run individual chunks of code along with markdown and plain text (so they can kinda be like a regular notebook too!)
- You can see outputs immeadiately, right in the notebook
- Conceptually pretty similar to R Markdown
   

## Why use jupyter notebooks?
- Code + markdown allows for records of lots of things in one place
- Great for trying lots of things/visualizing output
- Great for communicating/group projects!


Here's a [cheat sheet](https://medium.com/ibm-data-science-experience/markdown-for-jupyter-notebooks-cheatsheet-386c05aeebed) for formatting in Jupyter Notebooks: 



## How can I run code in a jupyter notebook?
- To run all code in a single cell, press shift + enter in that cell
- In the 'Cell' menu, there are also options for running all cells, or all cells below/above the current one
- Cells can also have comments where the line starts with `#` -- these are not run





```python
2+2
# Here's a comment
```




    4



## You can also add images
![Jupyter Meme](https://echanclarityinsights.github.io/images/2018-12-26/cat-meme.jpg)


# Loading modules

Regular python can do a lot, but one of the main reasons why it is used so much is that there are many **modules**, or build-on sets of functions, that are extremely helpful. Similarly to how in R we load packages, we can load these modules for use using the `import` command. 

For the purposes of these tutorials, we'll use these modules a lot. Although not strictly necessary, there are standard abbreviations for importing some of these modules


```python
import numpy as np
import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sns
```

We will discuss some of these modules in more detail as we get to later sections

# Navigating files using jupyter notebooks

There are a few ways you start jupyter notebooks running:
- You can type `jupyter notebook` from your command line
- If you use Anaconda, you can click the jupyter notebook icon from the Anaconda menu
- jupyter notebooks by default save themselves every few seconds, but you can always check the top (next to the file name) to see when the notebook was last saved


## The working directory

Every python session has a _working directory,_ or a "home base" folder. Essentially, this is the folder that python is "in". By default, the working directory of a jupyter notebook will be wherever that notebook file (ending in .ipynb) is saved


## File paths

Every single file and folder on your computer has an address. You can navigate these paths in your computer's built in file browser, but in order for python to be able to access these files, you have to tell python the address.

* Mac/Linux: `"Folder name/Sub-folder name/File"` (note the forward slashes!)
* Windows: `"Folder name\Sub-folder name\File"` (note the backward slashes this time!)


### Absolute file paths

An **absolute file path** is a file's full address on your computer.  The way you specify that a file path starts from the root folder (the front entrance to your computer) differs operating systems:

* Mac/Linux: Start your file path with _a single forward slash,_ e.g. `"/Users/me/Documents/etc"`
* Windows: Start your file path with _the name of your drive,_ e.g. `"C:\Users\me\My Documents\etc"`

### Relative file paths

Relative file paths are directions that assume you're starting in the current working directory .

Relative file paths are shorter to type (because you don't need to specify all the directions to get from the root folder to the current working directory), but they do depend on what the current working directory is. 

To specify a relative path, you only need to start your path with file or folder name that exists in your current working directory. Any path that does _not_ start with a forward-slash or drive name is assumed to be a relative path, so your computer will start looking in your current working directory.

### How to go 'up' a level

`../` (on mac/linux) or `..\` on windows take you 'up' and out of the folder you are currently in.
 - You can chain these together to go up several levels if you want (`'../../otherFolder/myFile/csv'`)


#### The `os` module

In order to get information about files that are available to us to read into Python, we will be working with the `os` module. This module provides a way to interface with the operating system we are running Python on (Windows, Mac, or Linux). Let's start by first loading this module:


```python
import os
```

#### What's your working directory and where is the file you want?

Your working directory is the directory (and subdirectories) where the files you're working with are stored. You can check your working directory using `os.getcwd()`


```python
os.getcwd()
```




    '/Users/emily/Documents/GitHub/cu-psych-comp-tutorial/content/tutorials/python/1-r2python-translation'




```python
os.listdir()
```




    ['1-getting-started.md',
     '.DS_Store',
     '0-python-r.ipynb',
     '2-intro-programming.ipynb',
     '2-intro-programming.md',
     '0-python-r.md',
     '3-control-flow.md',
     '.ipynb_checkpoints',
     '3-control-flow.ipynb',
     '1-getting-started.ipynb',
     '_index.md']



You can access a list of everything (all files and directories) within your working directory using the `os.listdir()` function...


**Next:** [Intro to Programming in Python](/tutorials/python/1-r2python-translation/2-intro-programming/)

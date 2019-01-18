# R Tutorial Syllabus

Current revision: Fall 2018 (Workshop Version 2)

## Course Goals

1.	Emphasize the benefits of using R for data analysis.
2.	Teach students the basics of programming and graphing in R
3.	Help students to feel empowered and inspired to learn more R on their own/within a community of scientists/R users

## Intended Audience

Graduate students, advanced undergraduates and post-bacs in the psychology department who are interested in learning R or building on existing R skills. We expect a variety of backgrounds in terms of R experience and statistics experience.

## Course Elements

### Modules

The course is divided up into modules, each covering a different aspect of R. These lessons will build off of each other, staring with basic programming and continuing to data cleaning, graphing, and statistical modeling. Each module is made up of several separate components.

### Tutorials

Each module has a tutorial that the instructor will work through with the students. These are R markdown documents designed so that the students can follow along. The tutorial will cover basic skills and examples, as well as covering challenges and issues that students may encounter.

### Data Challenges

After the tutorial, students will have a chance to test their skills with a data challenge. This will ask them to do basic coding that will require them to use functions they learned in the tutorial, as well as generalize to related skills that weren't covered. This is an open challenge, so students can work alone or in groups, depending on their skill level, and the instructors will be available to answer quesitons and troubleshoot.

### Resources

Each module will have associated resources for students who wish to learn more. We have set up a github repository that includes all the materials for each module, as well as additional links, reading material, and tutorials created by others.

## Course Plan

### Why R?

The course will begin with a broad explanation of why students should consider learning R and using it for their research. Based on initial interviews, we aniticpate that the people interested in this course will have different levels of familiarity with R and with programming and statistics in general. This will also be a course overview so students can decide if this is the right course for them.

### Basic Programming

This is an optional module aimed at students who have no previous experience with programming. A major hurdle to getting people using R is often anxiety regarding programming, so this module is aimed to get students comfortable.

#### Topics to cover:

* Working with RStudio
    + Installing R & RStudio
    + Getting oriented to the RStudio window
    + Installing and loading packages
* Directories on your computer
    + The working directory
    + Absolute and relative file paths
* Variables
* Data types
    + Numeric data
        + Arithmetic operators
    + Logical data
    + Character data
    + Factor data
    + Non-data data
* Data structures
    + Vectors
        + Indexing into vectors
            + Numeric indexing
            + Logical indexing
        + Vectorized operations
        + Summarizing operations
    + Dataframes
        + Indexing into dataframes
* Pseudo-coding
* Operators
    + Relational operators (==, >, <, etc)
    + Logical operators (!, &, \|, etc)
* Functions
* Looking for help

### Data Cleaning

This module will cover the basics of data cleaning, which is the process of taking raw data and getting it ready for summarizing, plotting and analysis. We will use tidyverse, a set of packages that follows a common framework for "tidy" data.

#### Topics to Cover

* Loading data into R
* Basic Cleaning
    + Checking for missing or miscoded data
    + Renaming variables
    + Recoding variables
* Calculating new variables
* Reshaping Data
    + Filtering and subsetting data
    + Combining data from multiple sources
    + Reshaping data
* Saving cleaned data for later

### Descriptive Statistics

This module teaches students how to calculate and display basic descriptive statistics, and how to divide and aggregate data in different ways. We will build on tools from the "tidyverse".

### Basics of Graphing

This module builds on the previous two by introduing students to the ggplot package. Students will learn how to use ggplot to make basic graphs and plots.

### Modeling in R

This module will cover the common syntax for statistical tests in R, how to work with model objects, and visualize the results. This is *not* a statistics course, but a lesson on *how* to run statistical tests in the R environment.

### R markdown 

This mini-module will show some examples of output (word, html, pdf) from R markdown that can be useful for lab reports, analysis logs, or writing manuscripts.

### Data Simulation & Power Analysis 

We will show you how conduct simple and straightforward power analyses using simulation in R.

### Git and Github

This module will quick introduction to version control. We will learn how to make a github repository and link it to an R project, so that you can add github to your R workflow. https://happygitwithr.com/


## How can you help?

During our class presentation, we'll be handing out a sheet of questions. We want your feedback on the course material and our proposed teaching plan. As we present, please fill out this sheet and add your own comments.

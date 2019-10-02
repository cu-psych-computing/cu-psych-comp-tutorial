---
layout: page      # DON'T CHANGE THIS.
title: Welcome
---

{% comment %} See instructions in the comments below for how to edit specific sections of this workshop template. {% endcomment %}

Welcome to our tutorial repository! <b>This site is under construction</b>--please pardon our web dust.

{% comment %}
  SYLLABUS

  Show what topics will be covered.

  1. If your workshop is R rather than Python, remove the comment
  around that section and put a comment around the Python section.
  2. Some workshops will delete SQL.
  3. Please make sure the list of topics is synchronized with what you
  intend to teach.
  4. You may need to move the div's with class="col-md-6" around inside
  the div's with class="row" to balance the multi-column layout.

  This is one of the places where people frequently make mistakes, so
  please preview your site before committing, and make sure to run
  'tools/check' as well.
{% endcomment %}

<h2>In-person scientific computing support</h2>

During the fall 2019 semester, the [graduate methods support advisors](who) are holding
open office hours on **Mondays** (except the 4th Monday of each month) **from 10:30a to 12:00p.**
CU psychology graduate students can stop by for to chat about using computing tools at any stage of the research process. Use cases include, but are not limited to:

* conducting pre-study power analysis
* setting up tools for administering tasks in-person and online
* cleaning and analyzing data
* preparing presentations and manuscripts

Outside of office hours, the support advisors can also assist over [email](mailto:{{site.email}}).

<h2 id="syllabus">Syllabus: {{ site.workshop_title }}</h2>

This is our core introductory scientfic computing syllabus. The materials here are designed to be
suitable for learners with little to no prior programming experience.

{% include workshop_syllabus.html %}

<hr/>

<h2 id="oneoffs">Additional instructional materials</h2>

Many of these materials were originally prepared as presentations for Columbia Psychology R users,
but are also designed to be stand-alone tutorials that you can read through and learn from remotely.
These materials span a wider range of learner skill levels, and assume basic experience with
scientific computing.

{% include extra_tutorials.html %}

<hr/> 

<img src="{{relative_root_path}}/websiteFiles/funplot.png" title="scientific computing rules" alt="scientific computing rules" style="display: block; margin: auto;" width = "50%"/>

<hr/>

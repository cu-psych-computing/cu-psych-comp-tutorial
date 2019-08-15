---
layout: page      # DON'T CHANGE THIS.
title: Welcome
---

{% comment %} See instructions in the comments below for how to edit specific sections of this workshop template. {% endcomment %}

Welcome to our tutorial repository! We love using scientific computing to help us understand psychology.
We don't love writing website blurbs, though. We'll flesh this out soon.

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
<h2 id="syllabus">Syllabus: {{ site.workshop_title }}</h2>

{% include workshop_syllabus.html %}

<hr/>

<h2 id="oneoffs">Additional instructional materials</h2>

Many of these materials were originally prepared as presentations for Columbia Psychology R users,
but are also designed to be stand-alone tutorials that you can read through and learn from remotely.

{% include extra_tutorials.html %}

<hr/> 

<img src="../websiteFiles/funplot.png" title="scientific computing rules" alt="scientific computing rules" style="display: block; margin: auto;" width = "50%"/>

<hr/>

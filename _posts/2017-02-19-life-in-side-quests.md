---
title: Your life is a series of side quests
tags: [Productivity]
image: images/side-quest-example.jpg
description: Video games organize tasks in quests. There's no reason this can't work in real life, too.
---

![Image]({{ page.image }}){:style='margin-bottom:-10px'}
{:.full-image.cropped.bottom-space-4.top-space-4}

Video games tell you what to do using *quests* or *missions*. There's no reason this can't work in real life, too. Books tell us to lead purpose-driven lives with long-term and short-term goals. Seems like a perfect way to make your life an RPG.

## Missions

A *mission* is an achievable goal within 3 months or less. A mission should be broken down into sub-tasks. In other words, it's an actionable short-term goal.

<div class='mission-list top-space-4 bottom-space-4'>
<div class='mission-item'>
<h3>1703 Start a blog <em>#project</em></h3>
<ul>
<li>Figure out the design</li>
<li>Write a few articles</li>
<li>Publishing</li>
</ul>
</div>
<div class='mission-item'>
<h3>1704 Couch to 5K <em>#fitness</em></h3>
<ul>
<li>Study the running program</li>
<li>Week 1 - 0.5km</li>
<li>Week 2 - 1km</li>
<li>Week 3 - 2.5km</li>
<li>Week 4 - 5km</li>
</ul>
</div>
<div class='mission-item'>
<h3>1704 Get a job <em>#career</em></h3>
<ul>
<li>Send 4 resumes</li>
<li>Get an interview</li>
<li>Go through negotiation</li>
<li>Get hired</li>
</ul>
</div>
<div class='mission-item'>
<h3>1706 Plan vacation <em>#life</em></h3>
<ul>
<li>Decide on destination</li>
<li>Book tickets</li>
<li>Book accomodations</li>
<li>Bon voyage!</li>
</ul>
</div>
</div>

I prefix each mission with a projected date of completion (`1702` is 2017, February), but this is totally up to you. I do this to get a good retrospective at the end of the year of all the missions I've completed.

<div class='mission-list top-space-4 bottom-space-4 -single'>
<div class='mission-item -goals'>
<ul>
<li>1703 Start a blog</li>
<li>1704 Couch to 5K</li>
<li>1704 Job at Hyperfisk</li>
<li>1706 Vacation to Paris</li>
<li>1707 Remodel kitchen</li>
<li>1707 Learn guitar</li>
</ul>
</div>
</div>

## Keeping track

This system is so simple, you can use anything to keep track of it. As an Android user, I prefer using [Google Keep](https://keep.google.com). It lets me view all my missions at a glance, both ongoing and completed.

![Image](images/keep-missions.png){:style='max-width:400px;margin-bottom:-130px'}
{:.full-image.cropped.bottom-space-4.top-space-4}

There are a variety of other ways to keep track of your missions, including using plain notebooks and pens. What's important is you break your goals into manageable pieces, and give yourself a way to look back on your progress.

<style>
.mission-list {
  box-sizing: border-box;
  font-size: .86em;
}
.mission-item {
  box-sizing: border-box;
  margin: 8px;
  padding: 16px;
  border: solid 1px rgba(30, 144, 255, 0.2);
  box-shadow: 0 4px 8px rgba(30, 144, 255, 0.07);
  border-radius: 3px;
}
@media (min-width: 481px) {
  .mission-list {
    display: flex;
    margin-left: -200px;
    margin-right: -200px;
    justify-items: center;
  }
  .mission-item {
    flex: 0 0 25%;
    margin: 4px;
  }
}
.mission-item > h3,
.mission-item > ul,
.mission-item > ul > li {
  margin: 0;
  padding: 0;
  border: 0;
  list-style-type: none;
  background: transparent;
}
.mission-item > h3 {
  padding-bottom: 8px;
  margin-bottom: 8px;
  border-bottom: solid 1px rgba(30, 144, 255, 0.2);
}
.mission-item.mission-item > h3 > em {
  font-style: normal;
  font-weight: 400;
  font-size: .86em;
  font-family: sans-serif;
  color: rgba(30, 144, 255, 0.5);
  margin-left: 4px;
}
.mission-item > ul > li {
  margin-top: 2px;
}
.mission-item > ul > li::before {
  content: '';
  box-sizing: border-box;
  position: relative;
  left: 0;
  top: 1px;
  display: inline-block;
  width: 12px;
  height: 12px;
  border: solid 2px rgba(30, 144, 255, 0.2);
  border-radius: 2px;
  margin: 0 8px 0 0;
}
@media (min-width: 481px) {
  .mission-list.-single {
    margin-left: 100px;
    margin-right: 100px;
  }
  .mission-list.-single > .mission-item {
    flex: 1 0 auto;
  }
}
.mission-item.-goals > ul > li + li {
  border-top: solid 1px rgba(30, 144, 255, 0.2);
  padding-top: 4px;
  margin: 4px 0;
}
.mission-item.-goals > ul > li::before {
  background: rgba(30, 144, 255, 0.2);
  border-color: transparent;
}
</style>

---
title: Tables
date: 1980-01-01
---

### Modifiers
All block modifiers work, in addition to these:

| Class | Description |
|:-----|-----:|
| `.no-head` | Hide the `thead` |
| `.shortcuts` | Table of shortcut keys |
| `.lite-headings` | Lightey gray headings |
{:.no-head}

<br>

## Examples

### Wide table
This use the `.wide` modifier.

| Resolution | DPPX | Actual resolution | PPI     | Actual PPI | Size | Devices    |
| ---        | ---  | ---               | ---     | ---        | ---  |-----------:|
| 320 x 480  | @1x  | 320 x 480         | 163 ppi | 163 ppi    | 3.5" | iPhone 3GS |
| 320 x 480  | @2x  | 640 x 960         | 163 ppi | 326 ppi    | 3.5" | iPhone 4S  |
| 320 x 568  | @2x  | 640 x 1136        | 163 ppi | 326 ppi    | 4"   | iPhone 5   |
| 375 x 667  | @2x  | 750 x 1334        | 163 ppi | 326 ppi    | 4.7" | iPhone 6   |
| 414 x 736  | @3x  | 1242 x 2208       | 133 ppi | 401 ppi    | 5.5" | iPhone 6+  |
| ---        | ---  | ---               | ----    | ---        | ---  | ---        |
| 360 x 640  | @3x  | 1080 x 1920       | 147 ppi | 441 ppi    | 5"   | Galaxy S4 |
{:.wide}

<br>

### Shortcuts table
This uses the `.shortcuts` modifier.

|---|---|
| Switch | Description |
|---|---|
| `⌘⌥1` | toggle left (layers) |
| `⌘⌥2` | toggle right (inspector) |
| `⌘⌥3` | toggle both |
| `⌘.`  | presentation |
|---
| `⌘0` | 100% |
| `⌘1` | fit to screen |
| `⌘2` | fit selection to screen |
| `⌘3` | center selection |
{:.shortcuts}


---
title       : Schedule
subtitle    : 
author      : Wei Cui
job         : 
framework   : html5slides        # {io2012, html5slides, shower, dzslides, ...}
highlighter : prettify  # {highlight.js, prettify, highlight}
hitheme     : tomorrow      # 
widgets     : []            # {mathjax, quiz, bootstrap}
mode        : selfcontained # {standalone, draft}
knit        : slidify::knit2slides
---

## 20150313 job

0. Watch the video of MultiGeMS
1. Check EM algorithm of R code
2. Check EM algorithm of C++ code
3. Select all suspicious sites from GiaB and Upenn datasets (unpooled)
4. Find some region from true SNPs according to properties (such as coverage, quality, etc.)
5. Find some special region according to properties

---

## Check EM algorithm (R)

- Use all the default value from GeMS-3gen-submax.R
- Process data from file "samples"
- Run multiEM function

---

## Code (Without paste of default values)

```
data <- read.table(file="samples", header=FALSE, sep="\t")
data <- cbind(data, data[,1])
data <- data[, 4:8]
data <- t(data)
source("em.R")
multiEM("C", data, c(1),1)
```

---

## Check EM algorithm (C++)

- Modify code to add debug function
- Modify code to add test function
- Run without parameter

---

## 20150313 learning

0. R basic manipulation
1. slidify
2. ggplot2
3. googleVis

---

## STUDYING

1. Least Angle Regression
2. Robust subspace clustering
3. A Survey of Clustering Data Mining Techniques
4. Sparse Recovery via Differential Inclusions
5. ROP: Matrix Recovery via Rank-one Projections
6. <font color='red'>ParticleCall</font>

---

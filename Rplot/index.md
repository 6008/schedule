---
title       : R plot
subtitle    : Lattice, ggplot2, googleVis and rCharts
author      : Wei Cui
job         : 
framework   : io2012        # {io2012, html5slides, shower, dzslides, ...}
highlighter : highlight.js  # {highlight.js, prettify, highlight}
hitheme     : tomorrow      # 
widgets     : []            # {mathjax, quiz, bootstrap}
mode        : selfcontained # {standalone, draft}
knit        : slidify::knit2slides
---

## R Plot System

- Basic Plot
- Lattice
- ggplot2
- googleVis
- rCharts
- ...

---

## Lattice


---

## ggplot2

- Layer
- Scale
- Coordinate
- Facet

---


```r
library(ggplot2)
p <- ggplot(data=mpg, aes(x=displ, y=hwy, colour=factor(cyl)))
p + geom_point() + geom_smooth(method=loess)
```

<img src="assets/fig/unnamed-chunk-1-1.png" title="plot of chunk unnamed-chunk-1" alt="plot of chunk unnamed-chunk-1" style="display: block; margin: auto;" />

---


```r
library(ggplot2)
p <- ggplot(data=mpg, aes(x=displ, y=hwy))
p + geom_point(aes(colour=factor(cyl))) + geom_smooth(method=loess)
```

<img src="assets/fig/unnamed-chunk-2-1.png" title="plot of chunk unnamed-chunk-2" alt="plot of chunk unnamed-chunk-2" style="display: block; margin: auto;" />

---

## Layer control

- The first layer must be orginal data layer
- data is the source, must be dataframe
- aes(aesthetic) controlls the map from variable to graph

---


```r
library(ggplot2)
p <- ggplot(data=mpg, aes(x=hwy))
p <- p + geom_histogram(binwidth=1)
print(p)
```

<img src="assets/fig/unnamed-chunk-3-1.png" title="plot of chunk unnamed-chunk-3" alt="plot of chunk unnamed-chunk-3" style="display: block; margin: auto;" />

---


```r
library(ggplot2)
p <- ggplot(data=mpg, aes(hwy))
p + geom_histogram(binwidth=1, position='identity', alpha=0.5, 
aes(y=..density.., fill=factor(year))) + stat_density(geom='line',
position='identity', aes(colour=factor(year)))
```

<img src="assets/fig/unnamed-chunk-4-1.png" title="plot of chunk unnamed-chunk-4" alt="plot of chunk unnamed-chunk-4" style="display: block; margin: auto;" />

---


```r
library(ggplot2)
p <- ggplot(data=mpg, aes(hwy))
p + geom_histogram(binwidth=1, position='identity', alpha=0.5, 
aes(y=..density.., fill=factor(year))) + stat_density(geom='line',
position='identity', aes(colour=factor(year))) + facet_grid(year~.)
```

<img src="assets/fig/unnamed-chunk-5-1.png" title="plot of chunk unnamed-chunk-5" alt="plot of chunk unnamed-chunk-5" style="display: block; margin: auto;" />

---

## Position adjustment

Adjustment in one layer
- stack
- dodge
- fill
- identity
- jitter

---


```r
library(ggplot2)
p <- ggplot(data=mpg, aes(x=class, fill=factor(year)))
p + geom_bar(position='dodge'); p + geom_bar(position='stack')
p + geom_bar(position='fill'); p + geom_bar(position='identity',alpha=0.3)
```

<table>
<tr>
<td>
<img src="assets/fig/unnamed-chunk-7-1.png" title="plot of chunk unnamed-chunk-7" alt="plot of chunk unnamed-chunk-7" style="display: block; margin: auto;" />
</td>
<td>
<img src="assets/fig/unnamed-chunk-8-1.png" title="plot of chunk unnamed-chunk-8" alt="plot of chunk unnamed-chunk-8" style="display: block; margin: auto;" />
</td>
</tr>
<tr>
<td>
<img src="assets/fig/unnamed-chunk-9-1.png" title="plot of chunk unnamed-chunk-9" alt="plot of chunk unnamed-chunk-9" style="display: block; margin: auto;" />
</td>
<td>
<img src="assets/fig/unnamed-chunk-10-1.png" title="plot of chunk unnamed-chunk-10" alt="plot of chunk unnamed-chunk-10" style="display: block; margin: auto;" />
</td>
</tr>
</table>

---


```r
library(ggplot2); library(data.table); x=2001:2010
y=c(1.1,1.8,2.5,3.6,3.1,2.7,1.9,-0.1,-3.5,3.0); data=data.table(x,y)
p=ggplot(data,aes(x,y,fill=y))+geom_bar(stat="identity",position="identity")+
geom_abline(intercept=0,slope=0,size=1,colour='gray')+
geom_text(aes(label=y),hjust=0.5,vjust=-0.5)+scale_y_continuous(limits=c(-3.8,4.2))+
labs(x='Year',y='GDP increase rate %')+theme(plot.title=element_text("GDP"))
```

<img src="assets/fig/unnamed-chunk-12-1.png" title="plot of chunk unnamed-chunk-12" alt="plot of chunk unnamed-chunk-12" style="display: block; margin: auto;" />

---

## Color and shape control


```r
library(ggplot2)
p <- ggplot(mpg, aes(cty, hwy))
p + geom_point(aes(colour = factor(year),shape = factor(year),
size = displ), alpha = 0.6, position = 'jitter')
```

<img src="assets/fig/unnamed-chunk-13-1.png" title="plot of chunk unnamed-chunk-13" alt="plot of chunk unnamed-chunk-13" style="display: block; margin: auto;" />

---


```r
library(ggplot2)
cty.mean=with(mpg,mean(cty))
cty.sd=with(mpg,sd(cty))
p + geom_point(aes(colour = factor(year),shape = factor(year),
size = displ), 
alpha = 0.6, position = 'jitter') + scale_x_continuous(trans='log',
breaks=c(cty.mean-cty.sd,cty.mean,cty.mean+cty.sd), 
labels=c("high", "mean", "low")) + scale_y_continuous(trans='log')
```

<img src="assets/fig/unnamed-chunk-14-1.png" title="plot of chunk unnamed-chunk-14" alt="plot of chunk unnamed-chunk-14" style="display: block; margin: auto;" />

---


```r
library(ggplot2)
p <- ggplot(mtcars, aes(x=wt, y=mpg,colour=factor(cyl),label=rownames(mtcars)))
p + geom_text(hjust=0,vjust=-1,alpha=0.8)+ geom_point(size=3,aes(shape=factor(cyl)))
```

<img src="assets/fig/unnamed-chunk-15-1.png" title="plot of chunk unnamed-chunk-15" alt="plot of chunk unnamed-chunk-15" style="display: block; margin: auto;" />

---


```r
library(GGally)
ggpairs(USArrests)
```

<img src="assets/fig/unnamed-chunk-16-1.png" title="plot of chunk unnamed-chunk-16" alt="plot of chunk unnamed-chunk-16" style="display: block; margin: auto;" />

---

## Time series


```r
library(quantmod); library(ggplot2)
SSEC <- getSymbols('^SSEC',src='yahoo',from = '1997-01-01', auto.assign=FALSE)
close <- (Cl(SSEC)); time <- index(close); value <- as.vector(close)
ggplot(data.frame(time,value),aes(time,value)) + geom_line()
```

<img src="assets/fig/unnamed-chunk-17-1.png" title="plot of chunk unnamed-chunk-17" alt="plot of chunk unnamed-chunk-17" style="display: block; margin: auto;" />

---

## googleVis


---

## rCharts


---



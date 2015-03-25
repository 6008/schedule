---
title       : Particle
subtitle    : 
author      : 
job         : 
framework   : slideous        # {io2012, html5slides, shower, dzslides, ...}
highlighter : highlight.js  # {highlight.js, prettify, highlight}
hitheme     : tomorrow      # 
widgets     : []            # {mathjax, quiz, bootstrap}
mode        : selfcontained # {standalone, draft}
knit        : slidify::knit2slides
---

## Introduction


---

## Application: ParticleCall


---

## Related Papers



---

## Related Concepts

- Kalman filter
- Dynamic Bayesian network
- Deep learning

---

## Referece of DL

- http://deeplearning.net/reading-list/tutorials/
- http://blog.csdn.net/zouxy09/article/details/8775360
- http://llcao.net/cu-deeplearning15/
- https://www.coursera.org/course/neuralnets?from_restricted_preview=1&course_id=256&r=https%3A%2F%2Fclass.coursera.org%2Fneuralnets-2012-001%2Fclass
  

---

## Paper: Tutorial on Particle Filter

- Introduction
- Problem
- Kalman Filter
- Grid-Based Methods
- Particle Filter

---

## Introduction

Dynamic system requires at least 2 models
- System model: the evolution of state with time 
- Measurement model: noizy measurements to state

The probabilistic state-space formulation and the requirement for the updating of information on receipt of new measurements are ideally suited for the Bayesian approach

---

## Approach

- Target: Construct the posterior probability density function
- Prediction step: use system model to predict the state pdf
- Update step: use the latest measurement to modify the prediction pdf

---

## Problem: Bayesian Tracking


---

## Kalman Filter


---

## Extended Kalman Filter


---


## Grid-Based Methods


---


## Approximate Grid-Based Methods


---

## Particle Filtering Methods

1. Sequential Importance Sampling filter
2. Sampling importance resampling filter
3. Auxiliary sampling importance resampling filter
4. Regularized particle filter

---

## SIS Algorithm


---

## Degeneracy Problem


---

## Good Choice of Important Density


---

## Resampling


---

## Suboptimal Importance Density


---

## SIR Algorithm

---

## ASIR Algorithm

---

## RPF Algorithm


---

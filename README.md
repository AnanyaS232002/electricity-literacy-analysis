# Electricity Access and Literacy Analysis in India (1981–2001)

## Project Overview

This project investigates the relationship between electricity access and literacy rates across Indian districts between 1981 and 2001.

Using historical census data and econometric techniques in R, the analysis explores whether improvements in electricity access are associated with improvements in literacy, while accounting for district-specific and time-specific differences.

## Research Objectives

- Examine the relationship between electricity access and literacy rates.
- Analyze changes in electricity access and literacy across census years.
- Investigate the role of urbanization and tap-water access as additional explanatory variables.
- Apply panel data regression to account for district and year effects.
- Identify statistical patterns that may provide insights into infrastructure and educational development.

## Dataset

**File:** `CensusData1981to2001.csv`

The dataset contains 1,017 district-year observations across three census periods: 1981, 1991 and 2001.

| Variable | Description |
|---|---|
| `year` | Census year |
| `state` | State name |
| `st` | State abbreviation |
| `dist` | District identifier |
| `district` | District name |
| `urb` | Urbanization indicator |
| `lit` | Literacy indicator |
| `ele` | Electricity indicator |
| `tap` | Tap-water indicator |

Ten observations contain missing values in the four indicator variables. Complete-case analysis was used for the regression models, resulting in 1,007 observations.

*Note: Exact indicator definitions and the original dataset source should be documented using the source documentation.*

## Tools and Technologies

- **R Programming**
- Tidyverse – Data cleaning and manipulation
- Plm – Panel data econometrics
- Lmtest – Statistical hypothesis testing
- Sandwich – Robust covariance estimation
- Corrplot – Correlation visualization
- Ggplot2 – Data visualization

## Methodology

The analysis follows these stages:

1. Data cleaning and preprocessing
2. Exploratory Data Analysis (EDA)
3. Descriptive statistics and correlation analysis
4. Pooled Ordinary Least Squares (OLS) regression
5. Multiple Linear Regression
6. Two-Way Fixed Effects Panel Regression
7. Model comparison and statistical interpretation

## Regression Models

Three regression specifications were implemented:

- **Pooled OLS:** Establishes the baseline relationship between electricity access and literacy.
- **Multiple Linear Regression:** Incorporates urbanization and tap-water access as control variables.
- **Two-Way Fixed Effects:** Accounts for district-specific and year-specific effects to examine within-district relationships over time.

## Preliminary Findings

The two-way fixed-effects model produced the following estimates:

| Variable | Coefficient | Significance |
|---|---:|---|
| Electricity | 0.1171 | p < 0.01 |
| Urbanization | 0.0142 | Not significant |
| Tap water | 0.0118 | Not significant |

Key observations:

- Electricity access exhibits a positive and statistically significant association with literacy across all three regression specifications.
- The electricity coefficient decreases after accounting for district and year effects.
- Urbanization and tap-water access are not statistically significant in the two-way fixed-effects specification.

These findings indicate an association rather than establishing a causal relationship. The reported significance levels are from the initial regression output; clustered robust standard errors require separate validation.

## Conclusion

The analysis explores how electricity access and literacy have evolved across Indian districts over two decades. Panel data regression provides a framework for examining their relationship while accounting for persistent district differences and common time effects.

## Future Scope

- Explore gender-wise literacy differences.
- Investigate urban-rural disparities.
- Perform state-level comparative analysis.
- Incorporate additional socioeconomic variables.
- Explore stronger causal identification strategies.

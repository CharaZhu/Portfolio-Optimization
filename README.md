#Portfolio Optimization 

##### Description
</br>

#### TABLE OF CONTENTS 
- [Background](#background) 
- [Dataset](#dataset) 
- [Requirement](#requirement)
- [Get Started](#Get-Started !)
 <br/>

 
## Background
 
The purpose of this project is to implement and compare several different
financial optimization models. Portfolios will be generated using these models
and these portfolios will be tested out-of-sample. 
1. Mean-variance optimization (MVO)
2. Robust mean-variance optimization (ellipsoidal uncertainty set)
3. Risk Parity optimization with no short selling.
4. market portfolio
</br> </br> 


Asset Universe
Our investment universe consists of 20 stocks (n=20) all of which are con-
stituents of the S&P 500. The stock symbols are
F (Ford Motor Co.);CAT (Catepillar Inc.);DIS;MCD;KO; PEP;WMT;C;
WFC; JPM ,AAPL; IBM; PFE; JNJ;XOM;MRO;ED; T; V Z; and NEM:
## Dataset

...

</br> </br>  
 
 
## Requirement
...
</br> </br> 
 
 
## Technical-Approach

#### 1. 
...
</br> </br> 

#### 2. 
... 
</br> </br> 

 

## Limitations and Future Improvements
...

* Add more explanations (Requirement, algorithm) 
 

1.  

a.	automatically collects assets’ prices and risk free rate from Yahoo finance
b.	computes estimated parameters, and risk aversion(lambda)
c.	computes the fourth market portfolio weight
d.	computes major portfolio quantities such as portfolio return, variance, volatility and sharpe ratio. 


 

## Get Started !

### Running order  

#### 1. `Computational Project(python).ipynb`
- Compute risk aversion (lambda), estimated stock expected return (save as `mu.csv`), covariance (save as `Q.csv`) & realized return at Oct 2008 (save as `oct_asset_return.csv`)
- Implement market portfolio, generate portfolio weights

#### 2.	`MVO.m`  , `robust.m` & `risk_parity.m
- Implement Mean-Variance Optimization, Robust MVO & Risk Parity Optimization, generate portfolio weights
 
#### 3.	Collect 3 sets of weights generated from step 2, 3, 4 into “Computational Project(python).ipynb” and combine with the fourth market portfolio weight to compute portfolio returns, variances, volatilities, and sharpe ratios

####  6.	`EF_no_short.m` & `EF_with_short.m`
plot MVO and Robust MVO efficient frontiers without & with short sale





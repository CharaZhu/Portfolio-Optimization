#Portfolio Optimization 

##### Implementation of financial optimization models
efficient frontiers
</br>

#### TABLE OF CONTENTS 
- [Background](#background) 
- [Data](#data) 
- [Requirement](#requirement)
- [Get Started !](#Get-Started-!)
- [Limitations and Future Improvements](#Limitations-and-Future-Improvements)
 <br/>

## Background
 
The purpose of this repo is to implement and compare several different financial optimization models. 
Portfolios will be generated using these models and these portfolios will be tested out-of-sample. 
1. Mean-Variance Optimization (MVO)
2. Robust Mean-Variance Optimization (ellipsoidal uncertainty set)
3. Risk Parity Optimization (no short selling)
4. Market Portfolio
</br> </br> 

 
## Data
Investment universe consists of 20 stocks (n=20) all of which are constituents of the S&P 500. The stock symbols are
F (Ford Motor Co.);CAT (Catepillar Inc.);DIS;MCD;KO; PEP;WMT;C; WFC; JPM ,AAPL; IBM; PFE; JNJ;XOM;MRO;ED; T; V Z; and NEM.
</br> </br>  
 
 
## Requirement
`pandas` </br>
`numpy` </br>
`matplotlib` </br>
`pandas_datareader` </br>
`datetime`
</br> </br> 
 
 
## Get Started !

### Running order  

#### 1. `Computational Project (Python).ipynb`
- Automatically collect stock price and risk free rate from `Yahoo Finance`
- Compute risk aversion `lambda`, estimated stock expected return (save as `mu.csv`), covariance (save as `Q.csv`) & realized return at Oct 2008 (save as `oct_asset_return.csv`)
- Generate Market Portfolio 
</br>

#### 2.	`MVO.m`, `robust.m` & `risk_parity.m
- Import  `mu.csv`, `Q.csv`, `oct_asset_return.csv`
- Generate MVO, Robust MVO & Risk Parity Optimization portfolios 
</br>

#### 3.	`Computational Project (Python).ipynb`
- Compute portfolio return, variance, volatilitie & sharpe ratio using portfolio weights generated in step 2
</br>

#### 4.	`EF_no_short.m` & `EF_with_short.m`
- Plot MVO and Robust MVO efficient frontiers without & with short sale
</br></br>

## Limitations and Future Improvements
- Add more explanations  

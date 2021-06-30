% Risk Parity Optimization With No Short Selling

clc;clear;

% Define required parameters
mu = csvread('mu.csv',1,1);   % expected monthly return obtained from 12,30,2004 to 9,30,2008
Q = csvread('Q.csv',1,1);     % covariance obtained from 12,30,2004 to 9,30,2008 
x0 = repmat(0.05,21,1);       % initial guess of assest weights in portfolio

% A, b: Inequality constraints (<)
A = []; b = [];

% Aeq, beq: Equality constraints
Aeq = [ones(1,20) 0]; 
beq = 1;

% lb, ub: parameter bounds
lb = [zeros(20,1) ; -inf];  % without short selling
ub = Inf(21,1);

% Equalize risk contribution of each asset in portfolio
obj = @(x) sumsqr(x(1:20,1).*(Q*x(1:20,1)) - x(21,1));
RP = fmincon(obj, x0, A, b, Aeq, beq, lb, ub)

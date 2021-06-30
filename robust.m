% Robust Mean-Variance Optimization

clc;clear;

% Define required parameters
mu = csvread('mu.csv',1,1);   % expected monthly return obtained from 12,30,2004 to 9,30,2008
Q = csvread('Q.csv',1,1);     % covariance obtained from 12,30,2004 to 9,30,2008 
lambda = 3.593888876611477;   % risk aversion
T = 45;                       % sample size of observations
theta = diag(diag(Q)) / T;    % measure of uncertainty
x0 = repmat(0.05,20,1);       % initial guess of assest weights in portfolio

% A, b: Inequality constraints (<)
A = []; b = [];

% Aeq, beq: Equality constraints
Aeq = ones(1,20);
beq = 1;

% lb, ub: parameter bounds
lb_with_short = -Inf(20,1);     % with short selling
lb_without_short = zeros(20,1); % without short selling
ub = Inf(20,1);

% Robust MVO model for 90% confidence interval
confidence_90 = sqrt(chi2inv(0.90,20)); % distance between estimated and true mu at 90% confidence interval
obj_90 = @(x) lambda*x'*Q*x - mu'*x+ confidence_90*sqrt(x'*theta*x);
RMVO_90_with_short = fmincon(obj_90, x0, A, b, Aeq, beq, lb_with_short, ub)
RMVO_90_without_short = fmincon(obj_90, x0, A, b, Aeq, beq, lb_without_short, ub)

% Robust MVO model for 95% confidence interval
confidence_95 = sqrt(chi2inv(0.95,20)); % distance between estimated and true mu at 95% confidence interval
obj_95 = @(x) lambda*x'*Q*x- mu'*x + confidence_95*sqrt(x'*theta*x);
RMVO_95_with_short = fmincon(obj_95, x0, A, b, Aeq, beq, lb_with_short, ub)
RMVO_95_without_short = fmincon(obj_95, x0, A, b, Aeq, beq, lb_without_short, ub)

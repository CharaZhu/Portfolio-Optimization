% Mean-Variance Optimization (MVO)

clc;clear;

% Define required parameters
mu = csvread('mu.csv',1,1);   % expected monthly return obtained from 12,30,2004 to 9,30,2008
Q = csvread('Q.csv',1,1);     % covariance obtained from 12,30,2004 to 9,30,2008
lambda = 3.593888876611477;   % risk aversion
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

obj = @(x) lambda * x'*Q*x - mu'*x;  % try to minimize the objective function
MVO_with_short = fmincon(obj, x0, A, b, Aeq, beq, lb_with_short, ub)
MVO_without_short = fmincon(obj, x0, A, b, Aeq, beq, lb_without_short, ub)

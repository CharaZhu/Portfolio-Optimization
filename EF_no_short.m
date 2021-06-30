% Efficient Frontiers Without Short Sale Case

clc;clear;

% Define required parameters
mu_est = csvread('mu.csv',1,1);                % expected monthly return obtained from 12,30,2004 to 9,30,2008(estimated parameters)
mu_real = csvread('oct_asset_return.csv',1,1); % realized monthly return at oct,2008
Q = csvread('Q.csv',1,1);                      % covariance obtained from 12,30,2004 to 9,30,2008
x0 = repmat(0.05,20,1);                        % initial guess of assest weights in portfolio

% Define robust MVO related parameters
T = 45;                                        % sample size of observations 
theta = diag(diag(Q)) / T;                     % measure of uncertainty
confidence_90 = sqrt(chi2inv(0.90,20));        % distance between estimated and true mu at 90% confidence interval
confidence_95 = sqrt(chi2inv(0.95,20));        % distance between estimated and true mu at 95% confidence interval

% A, b: Inequality constraints (<)
A = []; b = [];

% Aeq, beq: Equality constraints
Aeq = ones(1,20);        
beq = 1;

% lb, ub: parameter bounds
lb_without_short = zeros(20,1); % without short selling
ub = Inf(20,1);

% Define lambda
num_lambda = 20;                             % number of chosen lambda
lambda = linspace(0.04,40,num_lambda);       % lambda range


% Initiate portfolio volatilities and returns for MVO and Robust MVO efficient frontiers:
vol_est_no_short_MVO = zeros(num_lambda,1);       % portfolio volatility
P_return_est_no_short_MVO = zeros(num_lambda,1);  % portfolio return

vol_act_no_short_MVO = zeros(num_lambda,1);
P_return_act_no_short_MVO = zeros(num_lambda,1);

vol_true_no_short_MVO =  zeros(num_lambda,1);
P_return_true_no_short_MVO = zeros(num_lambda,1);

vol_est_no_short_robust90_MVO = zeros(num_lambda,1);
P_return_est_no_short_robust90_MVO = zeros(num_lambda,1);

vol_act_no_short_robust90_MVO = zeros(num_lambda,1);
P_return_act_no_short_robust90_MVO = zeros(num_lambda,1);

vol_est_no_short_robust95_MVO = zeros(num_lambda,1);
P_return_est_no_short_robust95_MVO = zeros(num_lambda,1);

vol_act_no_short_robust95_MVO = zeros(num_lambda,1);
P_return_act_no_short_robust95_MVO = zeros(num_lambda,1);


for i=1:num_lambda
    
    % objective function for estimated and actual MVO frontier
    obj = @(x) lambda(i) * x'*Q*x - mu_est'*x;    
    % solve for portfolio weights
    MVO_without_short = fmincon(obj, x0, A, b, Aeq, beq, lb_without_short, ub);

    % estimated MVO no short frontier 
    vol_est_no_short_MVO(i,1) = sqrt(MVO_without_short' * Q * MVO_without_short);
    P_return_est_no_short_MVO(i,1) = mu_est' * MVO_without_short;
    
    % actual MVO no short frontier
    vol_act_no_short_MVO(i,1) = vol_est_no_short_MVO(i,1);
    P_return_act_no_short_MVO(i,1) = mu_real' * MVO_without_short;
    
    % objective function for true MVO frontier
    obj = @(x) lambda(i) * x'*Q*x - mu_real'*x; 
    % solve for portfolio weights
    MVO_without_short = fmincon(obj, x0, A, b, Aeq, beq, lb_without_short, ub);

    % true MVO no short frontier
    vol_true_no_short_MVO(i,1) = sqrt(MVO_without_short' * Q * MVO_without_short);
    P_return_true_no_short_MVO(i,1) = mu_real' * MVO_without_short;

    % objective function for estimated and actual robust MVO with 90% confidence interval
    obj_90 = @(x) lambda(i) * x'*Q*x - mu_est'*x + confidence_90*sqrt(x'*theta*x);
    % solve for portfolio weights (no short case)
    RMVO_90_without_short = fmincon(obj_90, x0, A, b, Aeq, beq, lb_without_short, ub);

    % estimated robust MVO with 90% confidence interval no short frontier
    vol_est_no_short_robust90_MVO(i,1) = sqrt(RMVO_90_without_short' * Q * RMVO_90_without_short);
    P_return_est_no_short_robust90_MVO(i,1) = mu_est' * RMVO_90_without_short;
    
    % actual robust MVO with 90% confidence interval no short frontier 
    vol_act_no_short_robust90_MVO(i,1) = vol_est_no_short_robust90_MVO(i,1);
    P_return_act_no_short_robust90_MVO(i,1) = mu_real' * RMVO_90_without_short;
    
    % objective function for estimated and actual robust MVO with 95% confidence interval
    obj_95 = @(x) lambda(i) * x'*Q*x - mu_est'*x + confidence_95*sqrt(x'*theta*x);
    % solve for portfolio weights (no short case)
    RMVO_95_without_short = fmincon(obj_95, x0, A, b, Aeq, beq, lb_without_short, ub);

    % estimated robust MVO with 95% confidence interval no short frontier 
    vol_est_no_short_robust95_MVO(i,1) = sqrt(RMVO_95_without_short' * Q * RMVO_95_without_short);
    P_return_est_no_short_robust95_MVO(i,1) = mu_est' * RMVO_95_without_short;
    
    % actual robust MVO with 95% confidence interval no short frontier 
    vol_act_no_short_robust95_MVO(i,1) = vol_est_no_short_robust95_MVO(i,1);
    P_return_act_no_short_robust95_MVO(i,1) = mu_real' * RMVO_95_without_short;     

end   


% plot for no short efficient frontiers
plot(vol_est_no_short_MVO, P_return_est_no_short_MVO, 'm-o', vol_act_no_short_MVO, P_return_act_no_short_MVO, 'm-*', vol_true_no_short_MVO, P_return_true_no_short_MVO, 'k-o', vol_est_no_short_robust90_MVO, P_return_est_no_short_robust90_MVO, 'r-o', vol_act_no_short_robust90_MVO, P_return_act_no_short_robust90_MVO, 'r-*', vol_est_no_short_robust95_MVO, P_return_est_no_short_robust95_MVO, 'g-o', vol_act_no_short_robust95_MVO, P_return_act_no_short_robust95_MVO, 'g-*')
legend('estimated MVO no short frontier', 'actual MVO no short frontier', 'true MVO no short frontier', 'estimated robust90 no short frontier', 'actual robust90 no short frontier', 'estimated robust95 no short frontier', 'actual robust95 no short frontier')
ylabel('Expected Portfolio Return')
xlabel('Portfolio Volatility')
title('Efficient Frontiers Without Short Sale')
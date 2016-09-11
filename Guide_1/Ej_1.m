%% GUIDE 1 EXCERCISE 1

clc; close all;

% Add the directory path of common functions
addpath('../Common functions');

% Define x as a symbolic variable
syms x;

% Range to work
xMin    = 0;
xMax    = 1;
Lx      = xMax- xMin;
epsilon = 0.01;
domain  = (xMin: epsilon: xMax);

% Phi is the function to approximate
phi = 1+ sin(pi* 0.5* x);

% Compute funcion in domain
phiValues = subs(phi, 'x', domain);

% Psi is the function to satisfy boundary conditions
psi = x+ 1;

% Define number of functions
M = 5;

% Define the points where evaluate
points = (xMin+epsilon: Lx/M: xMax-epsilon);

% Trial Functions 
Nm = sin((pi* (1:1:M)* x)/ Lx);

%% POINT COLLOCATION

% Compute klm matrix
KpointCollocation = subs(Nm, 'x', points');

% Compute fl vector
FpointCollocation = subs(phi- psi, 'x', points');

% Resolve system
ApointCollocation = KpointCollocation\ FpointCollocation;

% Compute the approximate solution
phiPointCollocation       = eval(psi+ Nm* ApointCollocation);
phiPointCollocationValues = subs(phiPointCollocation, 'x', domain);

% Compute square error
errPointCollocation = eval(sum((phiValues-phiPointCollocationValues) .^ 2));

% Plot result
plotFunctions(                             ...
    xMin                                 , ...
    xMax                                 , ...
    epsilon                              , ...
    'x'                                  , ...
    'y'                                  , ...
    'Approximation by Point Collocation' , ...
    false                                , ...
    true                                 , ...
    {phi; phiPointCollocation}           , ...
    {'\phi'; '\phi\_approx'}               ...
);

% Print error
fprintf('Square mean error is %.6f to %d points. \n', errPointCollocation, M);


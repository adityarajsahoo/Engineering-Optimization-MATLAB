clc;
clear all;
syms x1 x2 x3
f1 = x2^2*x3 + x1*exp(x3);
T = taylor(f1,[x1 x2 x3],[1 0 -2],'order',3);
disp(T);
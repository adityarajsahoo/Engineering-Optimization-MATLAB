clc;
clear all;
syms x1 x2
f1 = (x1-1)^2*exp(x2)+x1;
T = taylor(f1,[x1 x2],[1 1],'order',3);
disp(T);
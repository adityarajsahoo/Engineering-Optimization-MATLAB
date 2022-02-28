clc;
clear all;
A = [-1 -1 -1 ; -1 -2 -2 ; -1 -2 -3];
E = eig(A)
D1 = det(A(1,1))
D2 = det(A(1:2,1:2))
D3 = det(A)
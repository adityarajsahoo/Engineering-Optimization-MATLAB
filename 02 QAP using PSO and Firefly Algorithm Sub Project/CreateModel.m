%
% Copyright (c) 2015, Yarpiz (www.yarpiz.com)
% All rights reserved. Please read the "license.txt" for license terms.
%
% Project Code: YPAP104
% Project Title: Solving QAP using PSO and Firefly Algorithm (FA)
% Publisher: Yarpiz (www.yarpiz.com)
% 
% Developer: S. Mostapha Kalami Heris (Member of Yarpiz Team)
% 
% Contact Info: sm.kalami@gmail.com, info@yarpiz.com
%

function model=CreateModel()

    w=[4  9  9  6  7  3  9  7  7  7  5  4  7  5  9  2  4  1  4  7
       9  3  7  1  5  7  7  9  5  5  3  5  6  6  5  8  5  1  2  4
       9  7  6  4  4  1  6  6  8  9  4  3  3  5  7  1  7  6  7  2
       6  1  4  5  3  7  4  4  7  6  6  7  7  4  3  1  4  5  8  1
       7  5  4  3  1  5  6  7  4  7  3  4  4  4  2  1  6  5  2  7
       3  7  1  7  5  9  3  6  6  7  5  3  6  8  6  7  6  4  2  1
       9  7  6  4  6  3  3  4  6  4  3  5  6  4  2  5  5  9  6  6
       7  9  6  4  7  6  4  4  2  3  6  5  7  3  1  6  9  4  1  3
       7  5  8  7  4  6  6  2  7  3  7  8  5  5  8  4  4  3  7  5
       7  5  9  6  7  7  4  3  3  9  9  7  4  6  2  4  5  3  9  5
       5  3  4  6  3  5  3  6  7  9  4  3  3  5  7  4  6  6  5  4
       4  5  3  7  4  3  5  5  8  7  3  6  5  7  9  5  8  6  4  3
       7  6  3  7  4  6  6  7  5  4  3  5  1  8  4  7  5  5  7  5
       5  6  5  4  4  8  4  3  5  6  5  7  8  6  2  4  9  5  3  2
       9  5  7  3  2  6  2  1  8  2  7  9  4  2  7  4  7  7  9  5
       2  8  1  1  1  7  5  6  4  4  4  5  7  4  4  4  4  7  5  4
       4  5  7  4  6  6  5  9  4  5  6  8  5  9  7  4  7  4  8  6
       1  1  6  5  5  4  9  4  3  3  6  6  5  5  7  7  4  4  4  5
       4  2  7  8  2  2  6  1  7  9  5  4  7  3  9  5  8  4  6  4
       7  4  2  1  7  1  6  3  5  5  4  3  5  2  5  4  6  5  4  9];
   
    
    % Units 19 and 20, must be as close as possible
    w(19,20)=10000;
    w(20,19)=10000;
    
    % Units 11 and 16, must be as close as possible
    w(11,16)=20000;
    w(16,11)=20000;
    
    % Units 1 and 13, must be as far as possible
    w(1,13)=-10000;
    w(13,1)=-10000;

    n=size(w,1);
    
    x=[70 63 11 5 43 94 10 2 68 74 24 89 59 59 41 7 73 86 34 88 83 19 66 8 64 56 92 83 36 77 74 8 51 30 60 51 17 81 65 54];
    
    y=[89 5 29 57 50 73 47 93 96 67 51 80 22 89 72 83 11 56 88 82 6 55 99 79 23 39 12 10 33 75 41 86 59 68 54 9 39 45 5 72];
    
    m=numel(x);
    
    d=zeros(m,m);
    
    for p=1:m
        for q=p+1:m
            d(p,q)=sqrt((x(p)-x(q))^2+(y(p)-y(q))^2);
            d(q,p)=d(p,q);
        end
    end
    
    model.n=n;
    model.m=m;
    model.w=w;
    model.x=x;
    model.y=y;
    model.d=d;

end
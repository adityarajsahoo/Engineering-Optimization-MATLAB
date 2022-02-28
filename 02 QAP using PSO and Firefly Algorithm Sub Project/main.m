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

Choices = {'Particle Swarm Optimization (PSO)', 'Firefly Algorithm (FA)'};

ANSWER = questdlg('Select the algorithm to solve Quadratic Assignment Problem.', ...
                  'QAP', ...
                  Choices{1}, Choices{2}, ...
                  Choices{1});

if strcmpi(ANSWER, Choices{1})
    pso;
    return;
end

if strcmpi(ANSWER, Choices{2})
    fa;
    return;
end

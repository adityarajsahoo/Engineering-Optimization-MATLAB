
% Project Title: Quadratic Assignment Problem using Genetic Algorithm

function i=RouletteWheelSelection(P)

    r=rand;
    
    C=cumsum(P);
    
    i=find(r<=C,1,'first');

end
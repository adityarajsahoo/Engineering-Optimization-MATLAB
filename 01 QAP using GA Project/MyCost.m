
% Project Title: Quadratic Assignment Problem using Genetic Algorithm

function z=MyCost(s,model) % s

    p=s(1:model.n); % s range in p
    
    n=model.n; % instances
    w=model.w; 
    d=model.d;
    
    z=0; % initial cost is 0
    for i=1:n
        for j=i+1:n
            z=z+w(i,j)*d(p(i),p(j));
        end
    end

end
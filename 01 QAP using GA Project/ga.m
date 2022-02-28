clc;
clear;
close all;

% Problem Definition

model=CreateModel();          

CostFunction=@(s) MyCost(s,model);    

nVar=model.m;      

VarSize=[1 nVar];   


% GA Parameters

MaxIt=1000;        

nPop=40;          

pc=0.4;                
nc=2*round(pc*nPop/2); 

pm=0.8;                 
nm=round(pm*nPop);      

beta=5;                 



% Initialization

empty_individual.Position=[];
empty_individual.Cost=[];

pop=repmat(empty_individual,nPop,1);

for i=1:nPop
    
    pop(i).Position=randperm(nVar);
    
    pop(i).Cost=CostFunction(pop(i).Position);
    
end

Costs=[pop.Cost];
[Costs, SortOrder]=sort(Costs);
pop=pop(SortOrder);

BestSol=pop(1);

WorstCost=max(Costs);

BestCost=zeros(MaxIt,1);



% Working Code

for it=1:MaxIt
    
    P=exp(-beta*Costs/WorstCost);
    P=P/sum(P);
   
    popc=repmat(empty_individual,nc/2,2);
    for k=1:nc/2
        
        i1=RouletteWheelSelection(P);
        i2=RouletteWheelSelection(P);
        p1=pop(i1);
        p2=pop(i2);
        
        [popc(k,1).Position, popc(k,2).Position]=PermutationCrossover(p1.Position,p2.Position);
        
        popc(k,1).Cost=CostFunction(popc(k,1).Position);
        popc(k,2).Cost=CostFunction(popc(k,2).Position);
        
    end
    popc=popc(:);
    
    popm=repmat(empty_individual,nm,1);
    for k=1:nm
        
        i=randi([1 nPop]);
        
        p=pop(i);
        
        popm(k).Position=PermutationMutate(p.Position);
        
        popm(k).Cost=CostFunction(popm(k).Position);
        
    end
    
    pop=[pop
         popc
         popm]; 
     
    Costs=[pop.Cost];
    [Costs, SortOrder]=sort(Costs);
    pop=pop(SortOrder);
    
    pop=pop(1:nPop);
    Costs=Costs(1:nPop);
    
    BestSol=pop(1);
    
    WorstCost=max(WorstCost,max(Costs));
    
    BestCost(it)=BestSol.Cost;
        
    disp(['Iteration ' num2str(it) ': Best Cost = ' num2str(BestCost(it))]);
    
    figure(1);
    PlotSolution(BestSol.Position,model);
    pause(0.01);
    
end

% Result Analysis

figure;
plot(BestCost,'LineWidth',2);
xlabel('Iteration');
ylabel('Best Cost');


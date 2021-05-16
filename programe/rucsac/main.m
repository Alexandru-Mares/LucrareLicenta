maxIt=1000;
dimPop=1000;
pMut=0.1;
maxRep=100;
greutati=[8 7 10 11 2 5 11 10 3 2 8 ];%creat cu randi([1,15],1,20)
profit=[48 28 7 8 13 43 13 41 13 47 18 ];%creat cu randi([1,50],1,20)
greutateMax=55;
nrCrom=length(profit);
pop=randi([0,1],dimPop,nrCrom);%initializare populatie
cal=zeros(dimPop,1);
tic
for i=1:dimPop
    cal(i)=sum(profit.*pop(i,:));
    if sum(greutati.*pop(i,:))>greutateMax
        cal(i)=0;
    end
end
[valMaxim,ind]=max(cal);
maxim=pop(ind,:);
it=1;
repetitii=1;
while it<maxIt&&repetitii<maxRep
    popNou=zeros(dimPop,nrCrom);
    for i=1:2:dimPop-1
        parinte1=selTur(pop,1,cal,nrCrom,dimPop);
        parinte2=selTur(pop,1,cal,nrCrom,dimPop);
        [popNou(i,:),popNou(i+1,:)]=recom2p(parinte1,parinte2,nrCrom);
        for j=1:nrCrom
            if(rand<=pMut)
                popNou(i,j)=mod(popNou(i,j)+1,2);
            end
            if(rand<=pMut)
                popNou(i+1,j)=mod(popNou(i+1,j)+1,2);
            end
        end
    end
    pop=popNou;
    for i=1:dimPop
        cal(i)=sum(profit.*pop(i,:));
        if sum(greutati.*pop(i,:))>greutateMax
            cal(i)=-1;
        end
        if cal(i)== valMaxim 
            if maxim==pop(i,:)
                repetitii=repetitii+1;
            else
                repetitii=1;
            end
        end
        if cal(i)>valMaxim
            valMaxim=cal(i);
            maxim=pop(i,:);
            repetitii=1;
        end            
    end   
    test(it)=max(cal);
end
contor=1;
solutie=0;
for i=1:nrCrom
    if maxim(i)
        solutie(contor)=i;
        contor=contor+1;
    end
end
toc
sum(greutati*transpose(maxim))
solutie
valMaxim
clear all;
% tic
drumuri=[ 0 5 inf 3 7 8 10 13 inf;
    5 0 3 6 inf 2 5 7 5;
    inf 3 0 10 2 4 6 15 3;
    3 6 10 0 7 1 inf 6 6;
    7 inf 2 7 0 inf 8 7 8;
    8 2 12 1 inf 0 3 2 12;
    10 5 6 inf 8 3 0 inf 3;
    13 7 15 6 7 2 inf 0 4;
    inf 5 3 6 8 12 3 4 0];
maxIt=20;
nrCrom=size(drumuri,1)+1;
dimPop=30;
pop=zeros(dimPop,nrCrom);
cal=zeros(1,dimPop);
for i=1:dimPop
    pop(i,:)=init(nrCrom);
    cal(i)=calitate(pop(i,:),drumuri);
end
[valMax,ind]=max(cal);
maxim=pop(ind,:);
it=1;
while it<maxIt
    tempPop=pop;
    for i=1:dimPop
        parinte=selRang(pop,cal);
        switch randi([1,4])
            case 1
                pct1=randi([2,6]);
                pct2=randi([2,6]);
                copil=parinte;
                copil(pct1)=parinte(pct2);
                copil(pct2)=parinte(pct1);
            case 2
                pct=randi([2,6]);
                copil=parinte;
                copil(2:nrCrom+1-pct)=parinte(pct:nrCrom-1);
                copil(nrCrom+2-pct:nrCrom-1)=parinte(2:pct-1);
            case 3
                copil=flip(parinte);
            otherwise
                copil=parinte;
        end
        tempPop(i,:)=copil; 
    end
    pop=tempPop;
    for i=1:dimPop
        cal(i)=calitate(pop(i,:),drumuri);
    end
    [maxCurent,ind]=max(cal);
    if maxCurent>valMax
        valMax=maxCurent;
        maxim=pop(ind,:);
    end
    it=it+1;
end
1/valMax;
maxim;
% timp=toc;
% X=[num2str(1/valMax),'&',num2str(timp), '&(',num2str(maxim(1)),', ',num2str(maxim(2)),', ',num2str(maxim(3)),', ',num2str(maxim(4)),', ',num2str(maxim(5)),', ',num2str(maxim(6)),', ',num2str(maxim(7)),', ',num2str(maxim(8)),', ',num2str(maxim(9)),', ',num2str(maxim(10)),',)\\'];
% disp(X)
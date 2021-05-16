format long
dimPop=10000;
maxIt=100;
f=@(x) (x(1)+1).^2+cos(x(2))+sin(x(3)).^2-x(4).^(-1)*x(5);
a=[-2 -1 0 3 -1 ];
b=[2 0 2 5 3];
int=zeros(1,length(a));
nrCrom=0;
prec=24;
pInter=0.5;
nrElite=10;
for i=1:length(a)
   int(i)=ceil(log2(abs(b(i)-a(i))));
   nrCrom=nrCrom+prec+int(i);
end
nrVar=length(a);
maxRepetitii=20;
pMut=0.2;
val=zeros(nrVar,1);
pop=zeros(dimPop,nrCrom);
cal=zeros(dimPop,1);
nrSel=2;
tic
for i=1:dimPop
    valid=1;
    gasit=1;
    pop(i,:)=randi([0,1],1,nrCrom);
    stg=1;
    for j=1:nrVar
        valid=1;
        dr=stg+int(j)+prec-1;
        while valid
            valid=0;
            val(j)=bi2fl(pop(i,stg:dr),int(j)+1)+a(j);
            if a(j)>val(j)||b(j)<val(j)
                pop(i,stg:dr)=randi([0,1],int(j)+prec);
                valid=1;
            end
        end
       stg=dr+1;
    end
    cal(i)=f(val);
end
[valMaxim,ind]=max(cal);
maxim=pop(ind,:);
repMax=1;
it=1;
%%
while it<=maxIt&&repMax<maxRepetitii
    %calcul calitate
    [tmp,ind]=sort(cal,'descend');
    elite=pop(ind(1:nrElite),:);
    popNou=pop;
    maxCurent=maxim;
    popNou(1:nrElite,:)=elite;
    for i=nrElite+1:2:dimPop
        parinti=selTur(pop,nrSel,cal,nrCrom,dimPop);
        popNou(i:i+1,:)=recomUnif(parinti,pInter);
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
        stg=1;
         for j=1:nrVar
            valid=1;
            dr=stg+int(j)+prec-1;
            val(j)=bi2fl(pop(i,stg:dr),int(j)+1)+a(j);
            stg=stg+int(j)+prec;
         end
        cal(i)=f(val);
        if cal(i)>valMaxim
            valMaxim=cal(i);
            maxim=pop(i,:);
            repMax=1;
        end
    end
    if maxCurent==maxim
        repMax=repMax+1;
    else
        repMax=1;
    end
    it=it+1;
end
toc
maxim;
valMaxim
stg=1;
for j=1:nrVar
    valid=1;
    dr=stg+int(j)+prec-1;
    val(j)=bi2fl(maxim(stg:dr),int(j)+1)+a(j);
    stg=stg+int(j)+prec;
end
val

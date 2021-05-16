n=1000;%marime populatie
maxIt=100;%maxim iteratii
f=@(x) cos(x.^2)+exp(sin(x))-sin(x.^2);
a=-4;
b=4;
prec=32;%precizie, cate cifre dupa virgula
int=ceil(log2(abs(b-a)));%biti necesari pentru a creea numere de la 0 la 8
nrCrom=int+prec;
pop=zeros(n,nrCrom);
pMut=0.1;%probabilitate mutatie 
maxRepetitii=5;%de cate ori sa se repete axceiasi solutie pana se opreste algoritmul
%% initializare
pop=zeros(n,nrCrom);
tic
for i=1:n
    valid=0;
    while valid==0
        pop(i,:)=randi([0 1],1,nrCrom);
        if (a<=(bi2fl(pop(i,:),int+1)+a))&&((bi2fl(pop(i,:),int+1)+a)<=b)
            valid=1;   
        end
    end
    
end
%% 
calMax=-inf;
maxim=zeros(1,nrCrom);
repMax=0;% de cate ori se repeta maximul 
%vecotr ce retine valori de calitate
it=1;
val=zeros(n,1);
popNou=pop;
for i=1:n
    val(i)=bi2fl(pop(i,:),int+1)+a;
end
cal=f(val);
%%
while it<=maxIt&&repMax<maxRepetitii
    %calcul calitate
    calMaxCurent=maxim;
    for i=1:2:n
    parinti=selTur(pop,2,cal,nrCrom,n);
    [popNou(i,:),popNou(i+1,:)]=recom1p(parinti(1,:),parinti(2,:),nrCrom);
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
    for i=1:n
        val(i)=bi2fl(pop(i,:),int+1)+a;
    end
    cal=f(val);
    for i=1:n
        if cal(i)>calMax
            calMax=cal(i);
            maxim=pop(i,:);
            repMax=1;
        end
    end
    if calMaxCurent==calMax
        repMax=repMax+1;
    end
    it=it+1;
end
toc
maxim=bi2fl(maxim,int+1)+a
f(maxim)
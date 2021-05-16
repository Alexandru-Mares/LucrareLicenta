format long
numar=numar+1;
n=10000;%marime populatie
maxIt=100;%maxim iteratii
f=@(x,y) cos(x.^2)+exp(sin(x.*y))-sin(y); % maxim= 4.7174 in punctul 3.5463    2.2082
a1=-3;
b1=3;
a2=-3;
b2=3;
maxRepetitii=20;
pMut=0.1;%probabilitate mutatie 
prec=32;%precizie, cate cifre dupa virgula

%% initializare
tic
int1=ceil(log2(abs(b1-a1)));
int2=ceil(log2(abs(b2-a2)));%biti necesari pentru a creea numere de la 0 la 8
nrCrom=int1+int2+prec*2;
pop=zeros(n,nrCrom);
for i=1:n
    valid=0;
    while valid==0
        pop(i,:)=randi([0 1],1,nrCrom);
        nr1=bi2fl(pop(i,1:int1+prec),int1+1)+a1;
        nr2=bi2fl(pop(i,int1+prec+1:nrCrom),int2+1)+a2;
        if (a1<=nr1)&&(nr1<=b1)&&(a2<=nr2)&&(nr2<=b2)
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
val=zeros(n,2);
popNou=pop;
for i=1:n
    val(i,1)=bi2fl(pop(i,1:int1+prec),int1+1)+a1;
    val(i,2)=bi2fl(pop(i,int1+prec+1:nrCrom),int2+1)+a2;
end
cal=f(val(:,1),val(:,2));
%%
while it<=maxIt&&repMax<maxRepetitii
    %calcul calitate
    calMaxCurent=maxim;
    for i=1:2:n
    parinti=selTur(pop,2,cal,nrCrom,n);
    [popNou(i,:),popNou(i+1,:)]=recom2p(parinti(1,:),parinti(2,:),nrCrom);
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
    val(i,1)=bi2fl(pop(i,1:int1+prec),int1+1)+a1;
    val(i,2)=bi2fl(pop(i,int1+prec+1:nrCrom),int2+1)+a2;
    if ~((a1<=val(i,1))&&(val(i,1)<=b1)&&(a2<=val(i,2))&&(val(i,2)<=b2))
           pop(i,:)=zeros(1,nrCrom);
           val(i,:)=[a1,a2];
    end
    end
    cal=f(val(:,1),val(:,2));
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
timp=toc;
maxim;
calMax;
sol=[bi2fl(maxim(1:int1+prec),int1+1)+a1,bi2fl(maxim(int1+prec+1:nrCrom),int2+1)+a2];
X = sprintf('%d&%0.2f &%0.6f &%0.6f &%0.6f \\\\ ',numar,timp,sol(1),sol(2),calMax);
disp(X)
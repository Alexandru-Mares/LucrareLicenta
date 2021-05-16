f=@(x) x(1)+5*x(2)+4*x(3)+3*x(4)+6*x(5)-100;
maxIt=50;
dimPop=10000;
pMut=0.1;
int=8;
nrNec=5;
nrCrom=nrNec*int;
val=zeros(nrNec,1);
pop=zeros(dimPop,nrCrom);
cal=zeros(dimPop,1);
nrSel=5;
pInter=0.4;
tic
for i=1:dimPop
    gasit=1;
    pop(i,:)=randi([0,1],1,nrCrom);
    for j=1:nrNec
        val(j)=bi2fl(pop(i,(int)*(j-1)+1:(int)*j),int+1);
    end
    cal(i)=1/(1+abs(f(val)));
end
%% 
[valMaxim,ind]=max(cal);
maxim=pop(ind,:);
it=1;
while it<maxIt
    popNou=pop;
    for i=1:nrSel:dimPop
        parinti=selRulN(pop,cal,nrSel);
        copii=recUnifMultip(parinti,pInter);
        for j=1:nrCrom
            for k=1:nrSel
                if(rand<=pMut)
                    copii(k,j)=mod(copii(k,j)+1,2);
                end
            end
        end
        popNou(i:i+nrSel-1,:)=copii;
    end
    pop=popNou;
    for i=1:dimPop
        for j=1:nrNec
            val(j)=bi2fl(pop(i,(int)*(j-1)+1:(int)*j),int+1);
        end
        cal(i)=1/(1+abs(f(val)));
        if cal(i)>valMaxim
            maxim=val;
            valMaxim=cal(i);
        end
    end
    it=it+1;
end
toc
maxim
f(maxim)

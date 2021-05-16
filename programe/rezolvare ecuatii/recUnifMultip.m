function [copii] = recUnifMultip(parinti,pI)
copii=parinti;
nrPar=size(parinti,1);
nrCrom=size(parinti,2);
a=zeros(nrCrom,1);
b=zeros(nrPar,1);
for i=1:nrCrom
    if(rand>pI)
        for j=1:nrPar
            a=copii(j,:);
            b(j)=a(i);
        end
        for j=nrCrom:2
            k=randi([1,j]);
            b(j)=b(j)+b(k);
            b(k)=b(j)-b(k);
            b(k)=b(j)-b(k);
        end
        for j=1:nrPar
            a=copii(j,:);
            a(i)=b(j);
            copii(j,:)=a;
        end
    end
end
end
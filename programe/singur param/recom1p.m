function [out1 , out2] = recom1p(par1,par2,nrCrom)
pct=randi(nrCrom);
out1=zeros(1,nrCrom);
out2=zeros(1,nrCrom);
for i=1:pct
    out1(i)=par1(i);
    out2(i)=par2(i);
end
for i=pct+1:nrCrom
    out1(i)=par2(i);
    out2(i)=par1(i);
end
end

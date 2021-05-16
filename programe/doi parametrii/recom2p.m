function [out1 , out2] = recom2p(par1,par2,nrCrom)
out1=zeros(1,nrCrom);
out2=zeros(1,nrCrom);
pct1=randi([1,nrCrom],1);
pct2=randi([1,nrCrom],1);
if pct1>pct2
    pct1=pct1+pct2;
    pct2=pct1-pct2;
    pct1=pct1-pct2;
out1=par1;
out2=par2;
for i=pct1:pct2
    out1(i)=par2(i);
    out2(i)=par1(i);
end
end

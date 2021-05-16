nrCrom=7;
parinte=init(nrCrom)
pct1=randi([2,6])
pct2=randi([2,6])

copil=parinte;
copil(pct1)=parinte(pct2);
copil(pct2)=parinte(pct1)
pct=randi([2,6])

copil=parinte;
copil(2:nrCrom+1-pct)=parinte(pct:nrCrom-1);
copil(nrCrom+2-pct:nrCrom-1)=parinte(2:pct-1)

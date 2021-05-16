function out = selTur(populatie,nrSel,calitate,nrCrom,n)
k=30;
out=zeros(nrSel,nrCrom);
cand=zeros(k,1);
for i=1:k
    gasit=1;
    while gasit
        cand(i)=randi(n);
        if length(unique(cand(1:i)))==i
            gasit=0;
        end
    end
end
gasit=1;

while gasit
    gasit=0;
    for i=1:k-1
        if(calitate(cand(i))<calitate(cand(i+1)))
            cand(i)=cand(i)+cand(i+1);
            cand(i+1)=cand(i)-cand(i+1);
            cand(i)=cand(i)-cand(i+1);
            gasit=1;
        end
    end
end
for i=1:nrSel
    out(i,:)=populatie(cand(i),:);
end
end
function [selectati] = selRulN(parinti,cal,nrSel)
dimPop=size(parinti,1);
nrCrom=size(parinti,2);
s=0;
selectati=zeros(nrSel,nrCrom);
for i=1:dimPop
    s=s+cal(i);
end
for i=1:nrSel
    k=s*rand;
    ind=2;
    val=cal(1);
    if k<=cal(1)
        selectati(i,:)=parinti(1,:);
    else
        gasit=1;
        while gasit
            val=val+cal(ind);
            if val>=k
                selectati(i,:)=parinti(ind,:);
                gasit=0;
            end
            ind=ind+1;
        end
    end
end
end
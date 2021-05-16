function [selectat] = selRang(candidati,cal)
[cal,ordine]=sort(cal);
dimPop=length(cal);
candOrd=zeros(size(candidati));%candidati ordonati
for i=1:dimPop
    candOrd(i,:)=candidati(ordine(i),:);
end
s=dimPop*(dimPop+1)/2;
k=randi([1,s],1);
val=1;
i=2;
gasit=1;
if(k==1)
    gasit=0;
    selectat=candOrd(1,:);
end
while(gasit)
    
    val=val+i;
    if val>=k
       gasit=0;
       selectat=candOrd(i,:);
    end
    i=i+1;
end
end
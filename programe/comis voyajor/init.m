function individ = init(nrCrom)
crom=ones(1,nrCrom);
 crom(1)=1;
 poz=2;
 while(poz<nrCrom)
     crom(poz)=randi([2,nrCrom-1]);
     if poz==length(unique(crom))
         poz=poz+1;
     end
 end
 crom(poz)=1;
 individ=crom;
end


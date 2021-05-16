function pop = initializare( nr_crom,pop_size,stg,dr )
pop=zeros(pop_size,nr_crom);
for(i=1:pop_size)
    valid=0;
    while valid==0
        for(j=1:pop_size)
            if rand>= 0.5
                pop(i,j)=1;
            end
        end
        if (stg<=bi2fl(pop(i,:))+stg)&&(bi2fl(pop(i,:))+stg<=dr)
            valid=1;
        else
            pop(i,:)=0;
        end
    end
    
end
end


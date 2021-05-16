function copii = recomUnif(parinti,pI)
copii=parinti;
for i=1:size(parinti,2)
    if rand<=pI
        copii(1,i)=parinti(2,i);
        copii(2,i)=parinti(1,i);
    end
end
end


function cal = calitate(individ,drumuri)
val=0;
for i=1:length(individ)-1
    val=val+drumuri(individ(i),individ(i+1));
end
cal=1/val;
end


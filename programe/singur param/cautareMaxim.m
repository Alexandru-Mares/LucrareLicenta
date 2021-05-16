maxim=0;
fMax=-inf;
f=@(x) cos(x.^2)+exp(sin(x))-sin(x.^2);
a=-4;
b=4;
for i=a:0.0001:b 
    if f(i)>fMax
        maxim=i;
        fMax=f(i);
    end
end
maxim
fMax
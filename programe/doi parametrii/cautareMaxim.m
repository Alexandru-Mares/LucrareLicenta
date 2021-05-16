%cautare maxim 
f=@(x,y) cos(x.^2)+exp(sin(x*y))-sin(y );
a1=-3;
b1=3;
a2=-3;
b2=3;
maxim=-inf;
sol=zeros(1,2);
tic
for i=a1:0.00001:b1
    for j=a2:0.00001:b2
        if f(i,j)>maxim
            maxim=f(i,j);
            sol(:)=[i,j];
        end
    end
end
toc
maxim
sol
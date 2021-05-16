%cautare maxim 
f=@(x) x(1).^2+cos(x(2))+sin(x(3)).^2-x(4).^(-1)*x(5);
a=[-2 -1 0 3 -1 ];
b=[2 0 2 5 3];
maxim=-inf;
sol=zeros(1,5);
tic
for i1=a(1):0.01:b(1)
    for i2=a(2):0.01:b(2)
        for i3=a(3):0.01:b(3)
            for i4=a(4):0.01:b(4)
                for i5=a(5):0.01:b(5)
                    if maxim<f([i1,i2,i3,i4,i5])
                        maxim=f([i1,i2,i3,i4,i5]);
                        sol=[i1,i2,i3,i4,i5];
                    end
                end
            end
        end
    end
end
toc
maxim
sol
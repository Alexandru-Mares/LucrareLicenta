%grafic
f=@(x,y) cos(x.^2)+exp(sin(x*y))-sin(y);
a1=-3;
b1=3;
a2=-3;
b2=3;
x=a1:0.01:b1;
y=a2:0.01:b2;
z=zeros(length(x));
maxim=-inf;
sol=zeros(1,2);
tic
for i=1:length(x)
    for j =1:length(x)
        z(j,i)=f(x(i),y(j));
        if z(j,i)>maxim
            maxim=z(j,i);
            sol(:)=[x(i),y(j)];
        end
    end
end
s=surf(x,y,z)
s.EdgeColor='none'
xlabel('Axa x')
ylabel('Axa y')
zlabel('Valori f()')
hold on
plot3(sol(1),sol(2),f(sol(1),sol(2)),'*','MarkerSize',12,'MarkerFaceColor','k')
legend({'suprafata f(x,y)','punct maxim'},'FontSize',22)
sol %timp rulare 307 secunde
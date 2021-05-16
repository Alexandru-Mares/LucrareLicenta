function float=bi2fl(binar,virgula)
n=length(binar);
int=0;
putereDoi=1;
for i=1:virgula-1
    int=int+2^(i-1)*binar(i);
    putereDoi=putereDoi*2;
end
fra=0;
for i=1:length(binar(virgula:n))  
        fra=fra+2^(-i)*binar(virgula+i-1);
end
float=int+fra;
end

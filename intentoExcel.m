%Nuevo inento de lectura en Excel
clear all
close all
clc

[ num , txt , raw]=xlsread('..\Clustering\datosjugadores.xlsx')
num(:,1)=[]
num(:,1)=[]
num(:,1)=num(:,1)/180000000
num(:,2)=num(:,2)/38
num(:,3)=num(:,3)/1000
raw(1,:)=[]

num=num'

net = newsom(num,[10,3]);
net.trainParam.epochs=1000;
net = train(net,num);
CLASSES=sim(net,num);

for k=1:size(CLASSES,1)
    display(sprintf('\nGrupo Nro.%i\n',k));
    for l=1:size(CLASSES,2)
        if CLASSES(k,l)==1
            display(raw(l,:));
        end
    end
    display(sprintf('\n'));
end

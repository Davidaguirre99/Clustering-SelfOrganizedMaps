clear all
close all
clc

%Tengo 16 animales:
%   01. Paloma
%   02. Gallo
%   03. Pato
%   04. Ganso
%   05. Buho
%   06. Gavilán
%   07. Águila
%   08. Zorro
%   09. Perro
%   10. Lobo
%   11. Gato
%   12. Tigre
%   13. Leon
%   14. Caballo
%   15. Zebra
%   16. Vaca

nombre(1,:)='Paloma ';
nombre(2,:)='Gallo  ';
nombre(3,:)='Pato   ';
nombre(4,:)='Ganso  ';
nombre(5,:)='Buho   ';
nombre(6,:)='Gavilán';
nombre(7,:)='Águila ';
nombre(8,:)='Zorro  ';
nombre(9,:)='Perro  ';
nombre(10,:)='Lobo   ';
nombre(11,:)='Gato   ';
nombre(12,:)='Tigre  ';
nombre(13,:)='Leon   ';
nombre(14,:)='Caballo';
nombre(15,:)='Zebra  ';
nombre(16,:)='Vaca   ';

%Sobre los cuales se responden las siguientes preguntas binarias
%   01. ¿Es un animal pequeño?
%   02. ¿Es un animal mediano?
%   03. ¿Es un animal grande?
%   04. ¿Tiene 2 patas?
%   05. ¿Tiene 4 patas?
%   06. ¿Tiene pelaje?
%   07. ¿Tiene cascos?
%   08. ¿Tiene una crin?
%   09. ¿Tiene pluma?
%   10. ¿Caza?
%   11. ¿Corre?
%   12. ¿Vuela?
%   13. ¿Nada?

%Con lo cual se puede levantar los siguientes vectores de características
P=[1 0 0 1 0 0 0 0 1 0 0 1 0    %   01. Paloma
   1 0 0 1 0 0 0 0 1 0 0 0 0    %   02. Gallo 
   1 0 0 1 0 0 0 0 1 0 0 1 1    %   03. Pato 
   1 0 0 1 0 0 0 0 1 0 0 1 1    %   04. Ganso 
   1 0 0 1 0 0 0 0 1 1 0 1 0    %   05. Buho 
   1 0 0 1 0 0 0 0 1 1 0 1 0    %   06. Gavilán 
   0 1 0 1 0 0 0 0 1 1 0 1 0    %   07. Águila 
   0 1 0 0 1 1 0 0 0 1 0 0 0    %   08. Zorro 
   0 1 0 0 1 1 0 0 0 0 1 0 0    %   09. Perro 
   0 1 0 0 1 1 0 0 0 1 1 0 0    %   10. Lobo 
   0 1 0 0 1 1 0 0 0 1 1 0 0    %   11. Gato 
   0 0 1 0 1 1 0 0 0 1 1 0 0    %   12. Tigre 
   0 0 1 0 1 1 0 0 0 1 1 0 0    %   13. Leon
   0 0 1 0 1 1 1 1 0 0 1 0 0    %   14. Caballo 
   0 0 1 0 1 1 1 1 0 0 1 0 0    %   15. Zebra 
   0 0 1 0 1 1 1 0 0 0 0 0 0];  %   16. Vaca

P=P'; %Transpongo la matriz (filas características y columnas numero de entrada)

%NET = NEWSOM(P,[D1,D2,...],TFCN,DFCN,OLR,OSTEPS,TLR,TNS) takes,
       %P       - RxQ matrix of Q representative input vectors.
       %Di      - Size of ith layer dimension, defaults = [5 8].
       %TFCN    - Topology function, default = 'hextop'. HEXTOP, GRIDTOP, or RANDTOP
       %DFCN    - Distance function, default = 'linkdist'.LINKDIST, DIST, or MANDIST
       %STEPS   - Steps for neighborhood to shrink to 1, default = 100.
       %IN      - Initial neighborhood size, default = 3.

net = newsom(P,[3 3]);

net.trainParam.epochs = 1000;
net = train(net,P);

CLASSES = sim(net,P); %Nro. de filas son los clusters, Nro. de columnas son los ítems clasificados

for k=1:size(CLASSES,1)
    display(sprintf('\nGrupo Nro.%i\n',k));
    for l=1:size(CLASSES,2)
        if CLASSES(k,l)==1
            display(nombre(l,:));
        end
    end
    display(sprintf('\n'));
end
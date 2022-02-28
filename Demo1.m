clc
clear all
Er1=input('enter er1')
Er2=input('enter er2')
E1=[24 36 42];
a=[1 1 2];
an=[1 1 2]/sqrt(6);
En=dot(E1,an);
En1=En*an
Dn1=Er1*En1
Dn2=Dn1
En2=Dn1/Er2
Et1=E1-En1
Et2=Et1;
E2=Et2+En2
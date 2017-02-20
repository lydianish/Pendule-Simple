//Lydia NISHIMWE
//TP noté 2
//Exercice 3 (proche des positions d'équilibre)

function Yprime = F(t,Y)//équation du mouvement proche de (0 0)
    Yprime(1)=Y(2);
    Yprime(2)=-omega^2*Y(1);
endfunction


//variables globales
g = 9.80665;
l = 1;
omega = sqrt(g/l);
gam = 0;//laché sans frottement

t0 = 0;
T = 2* %pi/omega;
n = 100;
t = linspace(t0,t0+T,n);
Y0 = [%pi/2;0]

//1. résolution du système
yt = ode(Y0,t0,t,F);

scf(7)
clf(7)
xtitle("solutions de l''équation du mouvement (avec vitesse initiale)", "temps")
plot(t,yt)
hl=legend(['angle y(t)';'vit ang y''(t)'],2);

scf(8)
clf(8)
xtitle("trajectoire dans le plan de phase (avec vitesse initiale)","angle", "vitesse angulaire")
plot(yt(1,:),yt(2,:),'r')

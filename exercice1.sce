//Lydia NISHIMWE
//TP noté 2
//Exercice 1 (sans vitesse initiale)

function Yprime = F(t,Y)//équation du mouvement
    Yprime(1)=Y(2);
    Yprime(2)=-gam*Y(2)-omega^2*sin(Y(1));//sans forçage, b(t)=0)
endfunction

function [Vx,Vy] = ChampVitesse(x,y)
    [X,Y] = meshgrid(x,y);
    X = X';
    Y = Y';
    Vx = Y;
    Vy = -gam*Y-omega^2*sin(X);
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
Y0 = [%pi/2;0]//laché de l'angle pi/2, avec vitesse initiale

//1. résolution du système
yt = ode(Y0,t0,t,F);

scf(1)
clf(1)
xtitle("solutions de l''équation du mouvement (sans vitesse initiale)", "temps")
plot(t,yt)
hl=legend(['angle y(t)';'vit ang y''(t)'],2);

//2. champ des vecteurs vitesse
nbv = 10;

xmin = min(yt(1,:));
xmax = max(yt(1,:));
ymin = min(yt(2,:));
ymax = max(yt(2,:));

x = linspace(xmin,xmax,nbv);
y = linspace(ymin,ymax,nbv);
[Vx,Vy]= ChampVitesse(x,y);

scf(2)
clf(2)
xtitle("champ des vecteurs vitesse (sans vitesse initiale)")
champ(x,y,Vx,Vy);

//3. tracé du trajectoire
scf(3)
clf(3)
xtitle("trajectoire dans le plan de phase (sans vitesse initiale)","angle", "vitesse angulaire")
plot(yt(1,:),yt(2,:),'r');

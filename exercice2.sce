//Lydia NISHIMWE
//TP noté 2
//Exercice 2 (avec vitesse initiale)

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
Y0 = [%pi/2;5]//laché de l'angle pi/2, sans vitesse initiale

//1. résolution du système
yt = ode(Y0,t0,t,F);

scf(4)
clf(4)
xtitle("solutions de l''équation du mouvement (avec vitesse initiale)", "temps")
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

scf(5)
clf(5)
xtitle("champ des vecteurs vitesse (avec vitesse initiale)")
champ(x,y,Vx,Vy);

//3. tracé du trajectoire
scf(6)
clf(6)
xtitle("trajectoire dans le plan de phase (avec vitesse initiale)","angle", "vitesse angulaire")
plot(yt(1,:),yt(2,:),'r')

%% Dinamica di un pendolo inverso

% - Attrito solo lungo la componente x
% - Inerzia e massa dell'asta trascurabili
% - Unico ingresso u applicato al carrello

close all
clear all
clc

syms m M l gravity u b f g h real
q = sym('q',[4,1],'real');         %[x,dx,phi,dphi]
dq = sym('dq',[4,1],'real');       %[dx,ddx,dphi,ddphi]

dq(1) = q(2);
dq(2) = (m*l*sin(q(3))*q(4)^2 - m*gravity*sin(q(3))*cos(q(3))+u-b*q(2))/(M+m*(sin(q(3)))^2);
dq(3) = q(4);
dq(4) = ((M+m)*gravity*sin(q(3)) - m*l*sin(q(3))*cos(q(3))*q(4)^2 - u*cos(q(3)) + b*q(2)*cos(q(3)) ) / (l*(M + m*(sin(q(3)))^2));

% Nella forma dx = f(x) + g(x)u

f(1) = q(2);
f(2) = (-b*q(2) - m*gravity*cos(q(3))*sin(q(3)) + m*l*sin(q(3))*q(4)^2)/(M+m*(sin(q(3)))^2);
f(3) = q(4);
f(4) = ((M+m)*gravity*sin(q(3)) - m*l*sin(q(3))*cos(q(3))*q(4)^2 + b*q(2)*cos(q(3)))/(l*(M + m*(sin(q(3)))^2));
f = f';

g(1) = 0;
g(2) = 1/(M+m*(sin(q(3)))^2);
g(3) = 0;
g(4) = -cos(q(3))/(l*(M + m*(sin(q(3)))^2));
g = g';

h = q(3);

% matlabFunction(f,'File','f_fun');
% matlabFunction(g,'File','g_fun');
% matlabFunction(h,'File','h_fun');





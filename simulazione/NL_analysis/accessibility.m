%% Accessibilità e Controllabilità del sistema

close all
clear all
clc

run dynamic.m;

%%

delta1 = g;                                         % g
rank(delta1)
rank(subs(delta1,q,[0,0,0,0]'))

%-------------------------------------------
delta2 = liebracket(f, g, q, 1);                    % g , [f,g] 
D = [delta1,delta2(:,2)];
det([D(1,1:2);D(2,1:2)])
rank(D)


%-------------------------------------------
delta31 = liebracket(g, delta2(:,2), q, 1);          % g , [f,g] , [g,[f,g]], [f,[f,g]]
delta32 = liebracket(f, delta2(:,2), q, 1); 

subs(delta31(:,2),q,[0,0,0,0]') % = 0   % non aggiunge rango alla matrice nell'equilibro
subs(delta32(:,2),q,[0,0,0,0]') % != 0

D = [delta1,delta2(:,2),delta32(:,2)];
rank(subs(D,q,[0,0,0,0]'))

D = [delta1,delta2(:,2),delta32(:,2)];
D = subs(D,q,[0,0,0,0]')
% righe=[1,2,3];
righe=[2,3,4];
D = [D(righe(1),1:3);D(righe(2),1:3);D(righe(3),1:3)]
D_det = det(D)
rank(D)

D = [delta1,delta2(:,2),delta32(:,2)];
righe=[2,3,4];
D = [D(righe(1),1:3);D(righe(2),1:3);D(righe(3),1:3)]
D_det = det(D)      % det è gunzione di q2 q3 q4

D_det = subs(D_det,q(1:3),[0,0,0]')
solve(D_det,q(4),'ReturnConditions',true)

D_det = subs(D_det,q(2),0)
D_det = subs(D_det,q(4),0)
solve(D_det,q(3),'ReturnConditions',true)

D_det = subs(D_det,q(3),pi/4)
D_det = subs(D_det,q(4),0)
solve(D_det,q(2),'ReturnConditions',true)
solve(D_det,q(2)) % esiste solo se b != 0 , altrimenti no

%-------------------------------------------

delta41 = liebracket(g, delta31(:,2), q, 1);    % g , [f,g] , [g,[f,g]], f,[f,g]],      [g,[g,[f,g]]], [g,[f,[f,g]]],         [f,[g,[f,g]]], [f,[f,[f,g]]]
delta42 = liebracket(g, delta32(:,2), q, 1); 
delta43 = liebracket(f, delta31(:,2), q, 1); 
delta44 = liebracket(f, delta32(:,2), q, 1);

subs(delta41(:,2),q,[0,0,0,0]') % = 0   
subs(delta42(:,2),q,[0,0,0,0]') % = 0
subs(delta43(:,2),q,[0,0,0,0]') % = 0   % non aggiungono rango alla matrice nell'equilibro
subs(delta44(:,2),q,[0,0,0,0]') % != 0   

% D = [delta1,delta2(:,2),delta31(:,2),delta32(:,2),delta41(:,2),delta42(:,2),delta43(:,2),delta44(:,2)];

%            [   g    [f,g]      [f,[f,g]]    [f,[f,[f,g]]] ]
D = simplify([delta1,delta2(:,2),delta32(:,2),delta44(:,2)]);
rank(D)
rank(subs(D,q,[0,0,0,0]'))

D = simplify([delta1,delta2(:,2),delta32(:,2),delta44(:,2)]);
D_det = simplify(det(D))

D_det = subs(D_det,q(1:3),[0,0,0]')
solve(D_det,q(4),'ReturnConditions',true)

% D = subs(D,q(1:3),[0,0,0]')
% D = subs(D,q(4),(gravity*l)^(1/2)/l)
% D = subs(D,q(4),(3^(1/2)*(gravity*l)^(1/2))/(3*l))
% det(D)
% rank(D)

D_det = subs(D_det,q(2),0)
D_det = subs(D_det,q(4),0)
solve(D_det,q(3),'ReturnConditions',true)

D_det = subs(D_det,q(3),pi/4)
D_det = subs(D_det,q(4),0)
solve(D_det,q(2),'ReturnConditions',true)
solve(D_det,q(2)) % esiste solo se b != 0 , altrimenti no

%-------------------------------------------

D = [delta1,delta2(:,2),delta32(:,2),delta42(:,2),delta43(:,2),delta44(:,2)];
D = [delta1,delta2(:,2),delta32(:,2)];
D = [delta1,delta2(:,2),delta32(:,2),delta43(:,2)];
D = [delta1,delta2(:,2),delta32(:,2),delta44(:,2)];
D = [delta2(:,2),delta32(:,2),delta42(:,2),delta43(:,2)];
D = subs(D,q(1:3),[0,0,0]')
D = subs(D,q(4),(gravity*l)^(1/2)/l)
D = subs(D,q(4),(3^(1/2)*(gravity*l)^(1/2))/(3*l))
det(D)
rank(D)


D = [delta1,delta2(:,2),delta42(:,2),delta44(:,2)];
D = subs(D,q(1:3),[0,0,0]')
D = subs(D,q(4),(gravity*l)^(1/2)/l)
det(D)
rank(D)


D = [delta1,delta32(:,2),delta42(:,2),delta44(:,2)];
D = subs(D,q(1:3),[0,0,0]')
D = subs(D,q(4),(3^(1/2)*(gravity*l)^(1/2))/(3*l))
det(D)
rank(D)

%%
delta51 = liebracket(f, delta44(:,2), q, 1);

D = simplify([delta1,delta2(:,2),delta32(:,2),delta44(:,2),delta51(:,2)]);
rank(D)
rank(subs(D,q,[0,0,0,0]'))

D = simplify([delta1,delta2(:,2),delta32(:,2),delta51(:,2)]);
D_det = simplify(det(D))

D_det = subs(D_det,q(1:3),[0,0,0]')
solve(D_det,q(4),'ReturnConditions',true)

D_det = subs(D_det,q(2),0)
D_det = subs(D_det,q(4),0)
solve(D_det,q(3),'ReturnConditions',true)

D_det = subs(D_det,q(3),pi/4)
D_det = subs(D_det,q(4),0)
solve(D_det,q(2),'ReturnConditions',true)
solve(D_det,q(2)) % esiste solo se b != 0 , altrimenti no



%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
delta51 = liebracket(f, delta41(:,2), q, 1);  % = 0
delta52 = liebracket(g, delta41(:,2), q, 1);  % = 0
delta53 = liebracket(f, delta42(:,2), q, 1); 
delta54 = liebracket(g, delta42(:,2), q, 1);
delta55 = liebracket(f, delta43(:,2), q, 1); 
delta56 = liebracket(g, delta43(:,2), q, 1); 
delta57 = liebracket(f, delta44(:,2), q, 1); 
delta58 = liebracket(g, delta44(:,2), q, 1);

subs(delta51(:,2),q,[0,0,0,0]') % = 0   
subs(delta52(:,2),q,[0,0,0,0]') % = 0
subs(delta53(:,2),q,[0,0,0,0]') % = 0  
subs(delta54(:,2),q,[0,0,0,0]') 
subs(delta55(:,2),q,[0,0,0,0]') % = 0   
subs(delta56(:,2),q,[0,0,0,0]') 
subs(delta57(:,2),q,[0,0,0,0]')  
subs(delta58(:,2),q,[0,0,0,0]') % = 0 

D = [delta1,delta2(:,2),delta31(:,2),delta32(:,2),delta41(:,2),delta42(:,2),delta43(:,2),delta44(:,2), ...
    delta51(:,2),delta52(:,2),delta53(:,2),delta54(:,2),delta55(:,2),delta56(:,2),delta57(:,2),delta58(:,2)];

D = subs(D,q(1:3),[0,0,0]')
D = subs(D,q(4),(gravity*l)^(1/2)/l)
D = subs(D,q(4),(3^(1/2)*(gravity*l)^(1/2))/(3*l))
det(D)
rank(D)


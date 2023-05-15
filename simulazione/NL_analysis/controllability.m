%% Accessibilità e Controllabilità del sistema

% le lie bracket che faccio qui sono solo queste combinazioni...
% [ g    [f,g]  [f,[f,g]] [f,[f,[f,g]]] .... ]
% delta = liebracket(f, g, q, 4);

delta1 = g;                                         % g
rank(delta1)

delta2 = liebracket(f, g, q, 1);                    % g , [f,g] 
D=[delta1,delta2(:,2)];
rank(D)

delta31 = liebracket(g, delta2(:,2), q, 1);          % g , [f,g] , [g,[f,g]], [f,[f,g]]
delta32 = liebracket(f, delta2(:,2), q, 1);
D=[delta1,delta2(:,2),delta31(:,2),delta32(:,2)];
rank(D)
rank(subs(D,q,[0,0,0,0]'))

D = subs(D,q(1:3),[0,0,0]')
D = subs(D,q(4),sqrt(gravity/l))
rank(D)
%%
D = [delta1,delta2(:,2),delta32(:,2)];
D = subs(D,q,[0,0,0,0]')
righe=[1,2,3];
righe=[2,3,4];
D_det = det( [D(righe(1),1:3);D(righe(2),1:3);D(righe(3),1:3)] )
solve(D_det,q(4),'ReturnConditions',true)
solve(D_det,q(2))

solve(D_det,q(2)) % esiste solo se b != 0 , altrimenti no
syms k1 k2
D_det = subs(D_det,q(3),k1*q(2))
D_det = subs(D_det,q(4),k2*q(2))

D_det = subs(D_det,M,1)
D_det = subs(D_det,m,0.5)
D_det = simplify(D_det)
D_det = subs(D_det,q(3),0)

%%

delta41 = liebracket(g, delta31(:,2), q, 1); %0          % g , [f,g] , [g,[f,g]], f,[f,g]],      [g,[g,[f,g]]], [g,[f,[f,g]]],         [f,[g,[f,g]]], [f,[f,[f,g]]]
delta42 = liebracket(g, delta32(:,2), q, 1); %
delta43 = liebracket(f, delta31(:,2), q, 1); % uguale alla 42, entrambe non aggiungono rango nelle singolarità di prima
delta44 = liebracket(f, delta32(:,2), q, 1);

D=[delta1,delta2(:,2),delta31(:,2),delta32(:,2),delta41(:,2),delta42(:,2),delta43(:,2),delta44(:,2)];
D=simplify([delta1,delta2(:,2),delta32(:,2),delta44(:,2)]);

rank(D)

D=[delta1,delta2(:,2),delta32(:,2),delta44(:,2)];
rank(subs(D,q,[0,0,0,0]'))
%%

D = simplify([delta1,delta2(:,2),delta32(:,2),delta44(:,2)]);
D_det = simplify(det(D))

D = subs(D,q(1:3),[0,0,0]')
D = subs(D,q(4),sqrt(gravity/l))
D = subs(D,q(4),(gravity*l)^(1/2)/l)
D = subs(D,q(4),(3^(1/2)*(gravity*l)^(1/2))/(3*l))

det(D)
rank(D)

solve(D_det,q(4),'ReturnConditions',true)
solve(D_det,q(4))

D_det = subs(D_det,M,1)
D_det = subs(D_det,l,0.5)
D_det = subs(D_det,m,0.5)
D_det = simplify(D_det)
D_det = subs(D_det,q(3),0)

%%
% if rank(delta) = 4 the system is small time local accessible (Chow's
% theorem). In realtà dovrebbero esserci tutte le altre combinazioni
% ma se queste mi generano già uno spazio di dim 4 allora va bene

%% The system is small time local accessible
% from accessibility to controllability, dot 3
% if f(q0) = 0 the system is also small time local controllable.
% la DeltaL è quella calcolata sopra

gravity = 9.81;
l = 0.5; 
m = 0.5; 
M = 1.0; 
b = 0.2;

q0 = [0,0,0,0]';

f0 = f_fun(M,b,gravity,l,m,q0)  % = 0

% [ g    [f,g]  [f,[f,g]] [f,[f,[f,g]]] .... ]
deltaL = liebracket(f, g, q, 4);
rank(subs(deltaL,q,q0)) % = 4 = n





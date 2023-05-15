% %% Per quanto visto nella Tavola 2 il sistema in forma ridotta è 
% % localmente controllabile e osservabile, si procede quindi cercando un 
% % cambio di variabili che porti il sistema in forma lineare.
% 
% %% (A) rank[g(x0) adfg(x0) ... adf3g(x0)] = n
% adfg = jacobian(g, q)*f - jacobian(f, q)*g;
% adf2g = jacobian(adfg, q)*f - jacobian(f, q)*adfg;
% adf3g = jacobian(adf2g, q)*f - jacobian(f, q)*adf2g;
% 
% adfg_fun = matlabFunction(adfg);
% adf2g_fun = matlabFunction(adf2g);
% adf3g_fun = matlabFunction(adf3g);
% 
% g0 = g_fun(M,l,m,[0,0,0,0]')
% adfg0 = adfg_fun(M,b,l,m,0,0);
% adf2g0 = adf2g_fun(M,b,gravity,l,m,0,0,0);
% adf3g0 = adf3g_fun(M,b,gravity,l,m,0,0,0);
% 
% rank([g0 adfg0 adf2g0 adf3g0])
% % La condizione (A) è pertanto verificata (condizione di raggiungibilità già vista prima)
% 
% %% (B) span{g, adfg, adf2g} sia involutivo
% % [g [f g]] appartiene a span{g, adfg, adf2g}
% gfg = jacobian(adfg, q)*g - jacobian(g, q)*adfg;
% 
% rank([g adfg adf2g gfg])
% % La condizione (B) è pertanto verificata ???

%% Linearizzazione in feedback ingresso-uscita 

Lfh = jacobian(h, q)*f

Lgh = jacobian(h, q)*g
subs(Lgh,q,[0,0,0,0]') % = 0 H1

Lf2h = jacobian(Lfh, q)*f
% LfLgh = jacobian(Lgh, q)*f;
LgLfh = jacobian(Lfh, q)*g 
subs(LgLfh,q,[0,0,0,0]')  % != 0 H2

LgLfh = jacobian(Lfh, q)*g % != 0 quindi grado relativo 2

% matlabFunction(Lfh,'File','Lfh_fun');
% matlabFunction(Lf2h,'File','Lf2h_fun');
% matlabFunction(LgLfh,'File','LgLfh_fun');

%% Feedback linearization
z = sym('z',[4,1],'real');
dz = sym('dz',[4,1],'real');
uu = sym('u',[1,1],'real');
v = sym('v',[1,1],'real');

z(1) = q(3);
z(2) = q(4);
z(3) = q(1);
z(4) = q(2)*cos(q(3)) + l*q(4);

dz(1) = z(2);
dz(2) = dq(1);
dz(3) = Lf2h + LgLfh*u; 
dz(4) = jacobian(z(4),q)*dq;

v = dz(3);
uu = ((M+m)*gravity*sin(q(3))+b*q(2)*cos(q(3))-m*l*cos(q(3))*sin(q(3))*q(4)^2)/cos(q(3))-l*v*(M+m*sin(q(3))^2)/cos(q(3));

%% Lg(PHIi(x)) = 0 r+1 <= i <= n
% allora la dinamica delle (n-r) variabili complementari è sia ininfluente
% sull'uscita del sistema linearizzato che indipendente dagli ingressi.
jacobian(z(3),q)*g
jacobian(z(4),q)*g

%% Infine perchè il cambio di variabili sia ammissibile deve essere verificata
% la condizione det(dPHI/dx) != 0
det(jacobian(z,q))

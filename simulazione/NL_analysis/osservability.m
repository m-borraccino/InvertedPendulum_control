%% Osservabilità del sistema

% h = [q(3)]; % l'uscita è solo l'angolo dell'asta

dh = jacobian(h, q);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Lf_h = jacobian(h, q)*f;
dLf_h = jacobian(Lf_h, q);

Lg_h = jacobian(h, q)*g;         % = 0 
dLg_h = jacobian(Lg_h, q);      % = 0
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 1/4,2/4
Lf_Lf_h = jacobian(Lf_h, q)*f;
dLf_Lf_h = jacobian(Lf_Lf_h, q);

Lf_Lg_h = jacobian(Lg_h, q)*f;        % = 0
dLf_Lg_h = jacobian(Lf_Lg_h, q);        % = 0

%3/4,4/4
Lg_Lf_h = jacobian(Lf_h, q)*g;
dLg_Lf_h = jacobian(Lg_Lf_h, q);

Lg_Lg_h = jacobian(Lg_h, q)*g;     % = 0
dLg_Lg_h = jacobian(Lg_Lg_h, q);      % = 0
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%1/8 2/8
Lf_Lf_Lf_h = jacobian(Lf_Lf_h, q)*f;
dLf_Lf_Lf_h = jacobian(Lf_Lf_Lf_h, q);

Lg_Lf_Lf_h = jacobian(Lf_Lf_h, q)*g;
dLg_Lf_Lf_h = jacobian(Lg_Lf_Lf_h, q);

% 3/8 4/8
Lf_Lf_Lg_h = jacobian(Lf_Lg_h, q)*f;
dLf_Lf_Lg_h = jacobian(Lf_Lf_Lg_h, q);

Lg_Lf_Lg_h = jacobian(Lf_Lg_h, q)*g;
dLg_Lf_Lg_h = jacobian(Lg_Lf_Lg_h, q);

% 5/8 6/8
Lf_Lg_Lf_h = jacobian(Lg_Lf_h, q)*f;
dLf_Lg_Lf_h = jacobian(Lf_Lg_Lf_h, q);

Lg_Lg_Lf_h = jacobian(Lg_Lf_h, q)*g;
dLg_Lg_Lf_h = jacobian(Lg_Lg_Lf_h, q);  

% 7/8 8/8
Lf_Lg_Lg_h = jacobian(Lg_Lg_h, q)*f;   
dLf_Lg_Lg_h = jacobian(Lf_Lg_Lg_h, q);   

Lg_Lg_Lg_h = jacobian(Lg_Lg_h, q)*g;     
dLg_Lg_Lg_h = jacobian(Lg_Lg_Lg_h, q);     
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Lf_Lf_Lf_Lf_h = jacobian(Lf_Lf_Lf_h, q)*f;
dLf_Lf_Lf_Lf_h = jacobian(Lf_Lf_Lf_Lf_h, q);

Lg_Lf_Lf_Lf_h = jacobian(Lf_Lf_Lf_h, q)*g;
dLg_Lf_Lf_Lf_h = jacobian(Lg_Lf_Lf_Lf_h, q);

%%
% se rank(delta) = 4 il sistema è localmente osservabile
dO = [dh; dLf_h; dLg_h;...
      dLf_Lf_h; dLf_Lg_h; dLg_Lf_h; dLg_Lg_h; ...
      dLf_Lf_Lf_h;dLg_Lf_Lf_h;dLf_Lf_Lg_h;dLg_Lf_Lg_h;dLf_Lg_Lf_h;dLg_Lg_Lf_h;dLf_Lg_Lg_h;dLg_Lg_Lg_h;...
      dLf_Lf_Lf_Lf_h;dLg_Lf_Lf_Lf_h];
rank(dO)

% il rango della codistribuzione di osservabilita' è pari a 3 se 
% retroaziono la phi, per cui il sistema NON è localmente osservabile

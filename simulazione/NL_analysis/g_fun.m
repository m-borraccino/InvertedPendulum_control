function g = g_fun(M,l,m,q)
%G_FUN
%    G = G_FUN(M,L,m,Q3)

%    This function was generated by the Symbolic Math Toolbox version 9.1.
%    19-Jun-2022 04:02:18

q1 = q(1);
q2 = q(2);
q3 = q(3);
q4 = q(4);

t2 = sin(q3);
t3 = t2.^2;
t4 = m.*t3;
t5 = M+t4;
t6 = 1.0./t5;
g = [0.0;t6;0.0;-(t6.*cos(q3))./l];

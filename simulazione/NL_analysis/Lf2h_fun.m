function Lf2h = Lf2h_fun(M,b,gravity,l,m,q2,q3,q4)
%Lf2h_fun
%    Lf2h = Lf2h_fun(M,B,GRAVITY,L,m,Q2,Q3,Q4)

%    This function was generated by the Symbolic Math Toolbox version 9.1.
%    19-Jun-2022 13:48:52

t2 = cos(q3);
t3 = sin(q3);
t4 = q4.^2;
t5 = t3.^2;
t6 = m.*t5;
t7 = M+t6;
t8 = 1.0./t7;
Lf2h = -t8.*(b.*q2+gravity.*m.*t2.*t3-l.*m.*t3.*t4)+(t8.*(gravity.*t3.*(M+m)+b.*q2.*t2-l.*m.*t2.*t3.*t4))./l;

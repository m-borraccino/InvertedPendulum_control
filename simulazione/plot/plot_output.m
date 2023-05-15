%% PLOTS

f = figure;
%  f.WindowState = 'maximized';

q_out = out.q.Data;

% errors
h(1) = subplot(4,1,1);
hold on
grid on
plot(q_out(:,1));
% legend('$\dot x$','Interpreter','latex')
title('Position')
xlabel('time [ms]')
ylabel('[m]')
axis([0 inf -inf inf])

h(2) = subplot(4,1,2);
hold on
grid on
plot(q_out(:,2));
% legend('$x$','Interpreter','latex')
title('Linear Velocity')
xlabel('time [ms]')
ylabel('[m/s]')
axis([0 inf -inf inf])

% errors
h(3) = subplot(4,1,3);
hold on
grid on
plot(q_out(:,3));
% legend('$\theta x$','Interpreter','latex')title('Errors')
title('Angle')
xlabel('time [ms]')
ylabel('[rad]')
axis([0 inf -inf inf])

h(4) = subplot(4,1,4);
hold on
grid on
plot(q_out(:,4));
% legend('$\dot \theta x$','Interpreter','latex')
title('Angle Velocity')
xlabel('time [ms]')
ylabel('[rad/s]')
axis([0 inf -inf inf])

saveas(f,'q.png')




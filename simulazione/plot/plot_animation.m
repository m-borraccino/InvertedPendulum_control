%% Pendulum animation
close all

fh = figure();
hold on
fh.WindowState = 'maximized';

axis equal
xlim([-2,4])
ylim([-2,2])
title('Pendulum','FontSize',12)
xlabel('x')
ylabel('y')
% Get data from ws variable
data = (out.q.Data(:,:));
data(:,4) = [];
data(:,2) = [];

if size(data,1) > size(data,2)
    data = data.';
end

data_len = numel(out.q.Time);
dt = out.q.Time(round(data_len/2)) - out.q.Time(round(data_len/2 - 1));

%%
steps = 30;
time = 0;
t_h = text(0,-0.5,['(' num2str(time,'%4.2f') ')']);
line    = plot(0,0,'k-');
Ball    = plot(0,0,'ro','MarkerSize',10,'MarkerFaceColor','r');
Vehicle = plot(0,0,'ro','MarkerSize',5,'MarkerFaceColor','k');

for i=1:steps:data_len
    
    time = time + steps*dt;
    delete(t_h)
    delete(line)
    delete(Ball)
    delete(Vehicle)
    t_h = text(0,-0.5,['(' num2str(time,'%4.2f') ')']);
    % Plot angle theta, particle and rope at time step
    theta = data(2,i);
    xp = l*sin(theta);
    yp = l*cos(theta);
    xL = [0; xp];
    yL = [0; yp];
    x_pos = data(1,i);
    
    %Plot system at current time
    line    = plot(x_pos+xL,yL,'k-');
    Ball    = plot(x_pos+xp,yp,'ro','MarkerSize',10,'MarkerFaceColor','r');
    Vehicle = plot(x_pos,0,'ro','MarkerSize',5,'MarkerFaceColor','k');
    
    drawnow()
    pause(0.1)
end

%%


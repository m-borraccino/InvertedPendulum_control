%% Inizializzazione parametri del sistema e condizioni iniziali
close all
clear all 
clc
addpath('./NL_analysis/'); addpath('./plot/'); 

gravity = 9.81;
l = 0.5; 
m = 0.5; 
M = 1.0; 
b = 0.2;
param = [M;m;l;gravity;b];

disp("Ready for Simulation...");

%% Simulation 1
% Kp = 1;
% Kd = 1;
Kp = 3.5;
Kd = 1;
q0 = [0,0,0.3,0]';

out = sim('Sim1.slx');
disp("Fine simulazione");

% Plot animation and outputs
%run plot_animation.m
run plot_output.m


%% Simulation 2
Kp = 3.5;
Kd = 0.8;
q0 = [1,0,-0.3,0]';

K_x  = 0.02;
K_dx = 0.04;

x_des = 0;

out = sim('Sim2.slx');
disp("Fine simulazione");

% Plot animation and outputs
% run plot_animation.m
run plot_output.m
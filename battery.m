%% Battery Charge Script
% July 2021
% Copyrigth by @clgbatista 
% CubeDesign @ INPE
%%
clear all
close all

num_days = 1;
step_size = 5;

sim_time = num_days*24*60*60; % nbr of days x 24 hours x 60 min x 60 sec
time = (0:step_size:sim_time)';
rows = length(time);

killswitch = zeros(rows,1);
killswitch(15*60/step_size+1:end) = 1;
killswitch = [time killswitch];

data = readtable('NCBR2-tle-47950_Trajectory(Cartographic).Centric.csv');
lat = [time data.Centric_LLR_Latitude_deg_];
lon = [time data.Centric_LLR_Longitude_deg_];
clear data

sunpanels_power = rand(length(time),1)/10*8/60;
sunpanels_power = [time sunpanels_power];

cnt = 1;
sun_time = zeros(rows,1);
sun_time(1:3600) = 1;
sun_time(5401:9101) = 1;
sun_time(10901:14501) = 1;
sun_time(16301:end) = 1;
sun_time = [time sun_time];


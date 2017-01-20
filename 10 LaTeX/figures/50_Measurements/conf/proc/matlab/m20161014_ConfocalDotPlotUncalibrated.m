clear;
clc;
close all;
% Load the csv data containing the intensity vector and the x,y positions
I = transpose(importdata('20161106 USAF Intensity 3'));
XY = transpose(dlmread('20161106 Driving Voltage'));

% Create custom colormap
n = 50;               %// number of colors

R = linspace(1,0.1255,n);  
G = linspace(1,0.29,n); 
B = linspace(1,0.530,n); 

% Plot the datapoints, skipping the first value (=4096)
scatter(XY(2:end,1),XY(2:end,2),20,I(2:end),'filled')
axis square;
colormap( [R(:), G(:), B(:)] );  %// create colormap%caxis([0 600])
caxis([0 500])
set(gca,'Color',[1. 1. 1.]);
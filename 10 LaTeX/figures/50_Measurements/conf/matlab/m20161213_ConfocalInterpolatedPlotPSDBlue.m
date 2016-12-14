% Plots the confocal microscopy data using the XY information from the PSD
clear;
clc;
close all;
t = cputime;

imgSize = 300;

% Load the csv data containing the intensity vector and the x,y positions
I = transpose(importdata('20161106 USAF Intensity 3'));
XY = transpose(dlmread('20161106 ScanConfig 90k 2 751.3 60'));

% Create custom colormap
n = 50;               %// number of colors

R = linspace(1,0.1255,n);  
G = linspace(1,0.29,n); 
B = linspace(1,0.530,n); 


colormap( [R(:), G(:), B(:)] );  %// create colormap

% Create dot plot
figure;
scatter(XY(2:end/2,3),XY(2:end/2,4),15,I(2:end/2),'filled')
axis square;
colormap( [R(:), G(:), B(:)] );  %// create colormap%caxis([0 600])
set(gca,'Color',[1. 1. 1.]);

% Create interpolating grid
[Xg,Yg]=meshgrid(linspace(min(XY(2:end/2,3)),max(XY(2:end/2,3)),imgSize), linspace(min(XY(2:end/2,4)),max(XY(2:end/2,4)),imgSize));

% Interpolate the XY datapoints into the grid
interpIntensity = griddata(XY(2:end/2,3),XY(2:end/2,4),I(2:end/2),Xg,Yg);

% Plot the interpolated data
figure;
imagesc(interpIntensity); 
axis square;
colormap( [R(:), G(:), B(:)] );  %// create colormap%caxis([0 600])
set(gca,'Color',[1. 1. 1.]);
set(gcf,'units','points','position',[0,0,imgSize,imgSize])
e = cputime-t

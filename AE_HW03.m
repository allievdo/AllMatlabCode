clearvars; close all; clc;

%Import from Excel 
filename = 'HW03_Data.csv'; %Replace with your Excel file name
data = readtable(filename); %Read the entire sheet into a table

%Extract the time and data from the data
time = data{:,1}; %The first column is the time
values = data{:,2}; %The second column is the data

%Plot the time series data
% figure;
% plot(time, values);
% xlabel('Day Index of Observation', 'FontName', 'Times New Roman', 'FontSize', 15);
% ylabel('Population Ratio to Maximum Environment Capacity', 'FontName', 'Times New Roman', 'FontSize', 15);
% title('Population Ratio to Maximum Environment Capacity per Day', 'FontName', 'Times New Roman', 'FontSize', 25);
% grid on;

L = discretize(values, 20);

L1 = L(1:end-1);
L2 = L(2:end);

Ln = [L1, L2];

T = accumarray(Ln, 1);

spy(T);

xlabel('Population Ratio on a Given Day', 'FontName', 'Times New Roman', 'FontSize', 15); %What would be the proper labels of this graph? Including Title
ylabel('Population Ratio on the Subsequent Day', 'FontName', 'Times New Roman', 'FontSize', 15);
title('Transition Matrix of Discretized Population Data', 'FontName', 'Times New Roman', 'FontSize', 25);

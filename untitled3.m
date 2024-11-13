clearvars; close all; clc;

x = rand;

%This will produce the time portrait
for i = 1:100000 %Time series does not necessarily depend on time. Future value of system depends on current value of the system
    x = [x; 4*x(end)*(1-x(end))]; %Find a new X and stack it on the bottom, the take the last number found and find the new x and put it on the bottom, etc.
end

plot(x)

% x = rand(size(x));
L = discretize(x,1000); %This simplifies the real numbers. Categorizes the data. Takes the decimals and rounds up to a whole number

L1 = L(1:end-1);
L2 = L(2:end);

Ln = [L1, L2]; %One column is current state, the next is the future state. A 2 dimensional histogram

T = accumarray(Ln, 1); %take this histogram and put everyhting in a matrix. This shows our time series is not random
%It is not random because it has a structured and symmetrical shape. If it
%was random, there would be points everywhere.The states here are very
%deterministic. If you are in 1, there is a 75% chance that you will stay
%in one. A lesser chance to move to 2 in 1

%imagesc(T) 
spy(T)
%colorbar

% v1 = x(1:end-1); %Take values from teh beginning to the value before the last
% v2 = x(2:end)
% 
% plot(v1, v2, '.b') %this will plot x as the x(n) and the y axis is x(n+1) (I think)

%3D version
% v1 = x(1:end-2); %Take values from teh beginning to the value before the last
% v2 = x(2:end-1);
% v3 = x(3:end);
% 
% box on
% grid on

% plot3(v1,v2,v3, '.b')
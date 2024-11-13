clearvars; close all; clc;

x = rand;

%This will produce the time portrait
for i = 1:1000 %Time series does not necessarily depend on time. Future value of system depends on current value of the system
    x = [x; 4*x(end)*(1-x(end))]; %Find a new X and stack it on the bottom, the take the last number found and find the new x and put it on the bottom, etc.
end

plot(x)

% v1 = x(1:end-1); %Take values from teh beginning to the value before the last
% v2 = x(2:end)
% 
% plot(v1, v2, '.b') %this will plot x as the x(n) and the y axis is x(n+1) (I think)

% v1 = x(1:end-2); %Take values from teh beginning to the value before the last
% v2 = x(2:end-1);
% v3 = x(3:end);
% 
% box on
% grid on

% plot3(v1,v2,v3, '.b')
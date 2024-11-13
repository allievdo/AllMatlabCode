clearvars; close all; clc;

f = @(t,x) [10*(x(2)-x(1));
            x(1)*(28-x(3))-x(2);
            x(1)*x(2)-(8/3)*x(3)];

[t,X] = ode45(f,[0,100], rand(3,1))

x = X(:,1); %Take the first column of X

% for i=1:size(X,1) %Makes red dot trace line
%     plot3(X(:,1), X(:,2), X(:,3)) %Disregarding time now
%     hold on
%     plot3(X(i,1), X(i,2), X(i,3), 'or', "MarkerFaceColor", 'red')
%     hold off
% end

plot(t, X) %The x axis is the time and y is the values of x
            %If big X is there Blue X, Z is yellow, and Y is Red

%plot3(X(:,1), X(:,2), X(:,3)) %Disregarding time now
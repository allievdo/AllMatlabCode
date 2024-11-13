clearvars; close all; clc;

I = dir("01\");

Matrix = [];

for i = 1:length(I)
    if ~I(i).isdir
        A = imread(['01\' I(i).name]);

        Matrix = [Matrix, A(:)];
    end
end

Matrix = double(Matrix);

[u,s,v] = svd(Matrix);

diagS = diag(s);

PrincipleComponent = Matrix * v;

for i = 1:4
    subplot(1,4,i)
    imagesc(reshape(PrincipleComponent(:,i), [28 28]))
    axis off

    box on
     title(['PC ' num2str(i)], 'FontName', 'Times New Roman', 'FontSize', 30);  % Specify Times New Roman for title  % Add titles for each principal component
end

for i = 1:length(diagS)
    E(i) = sum(diagS(1:i).^2)/sum(diagS.^2); %x axis is the singular values index, y is the energy
end

figure
plot(E)

hold on

%Define the specific point you want to show (replace xVal and yVal with your values
yVal = 0.98
xVal = find(E >= yVal, 1); %Find the index where E first reaches or exceeds yVal

%Check if xVal is valid
if ~isempty(xVal)
    %Plot the specific point
    plot(xVal, yVal, 'ro', 'MarkerSize', 10, 'MarkerFaceColor', 'r'); %Ro is for red circle
    text(xVal, yVal, sprintf('(%d, %.2f)', xVal, yVal), 'VerticalAlignment', 'bottom', 'HorizontalAlignment', 'right', 'FontName', 'Times New Roman', 'FontSize', 15);
else
    disp('The specific yVal is not within the range of E');
end

%Add labels and title
xlabel('Singular Values Index','FontName', 'Times New Roman', 'FontSize', 25); %x axis label
ylabel('Energy', 'FontName', 'Times New Roman', 'FontSize', 25);
title('Energy vs Singular Values Index', 'FontName', 'Times New Roman', 'FontSize', 30);

hold off

% % filename = 'cumulative_energy.svg'; % Specify your desired filename
% % saveas(gcf, filename);
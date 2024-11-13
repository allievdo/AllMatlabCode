clearvars; close all; clc;

filename = 'Mammal-comeback-in-Europe-data-OWID-download.csv'; %Replace with your Excel file name
data = readtable(filename);

% Data
species = data{:,1};
relative_change = data{:,6};
start_year = data{:,4};
end_year = data{:,5};

% Create bar chart
figure;
b = bar(relative_change, 'FaceColor', 'b'); % Set all bars to blue

% Set the x-axis labels to species names
set(gca, 'XTickLabel', species, 'XTick', 1:numel(species), 'FontName', 'Times New Roman', 'FontSize', 12);
xtickangle(90); % Rotate x-axis labels for readability
xlabel('Species','FontName', 'Times New Roman', 'FontSize', 20);
ylabel('Average Relative Change in Abundance','FontName', 'Times New Roman', 'FontSize', 20);
title('Average Relative Change in Abundance for Different Mammal Species','FontName', 'Times New Roman', 'FontSize', 25);
grid on;

for i = 1:numel(species)
    % Position the text above each bar
    yPos = relative_change(i); % Position the text at the top of each bar
    text(i, yPos, sprintf('%d-%d', start_year(i), end_year(i)), ...
        'HorizontalAlignment', 'center', 'VerticalAlignment', 'bottom', 'Color', 'k','FontName', 'Times New Roman', 'FontSize', 8);
end


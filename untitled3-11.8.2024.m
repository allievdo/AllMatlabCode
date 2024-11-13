clearvars; close all; clc;

A = [0 1 1;
     1 0 1;
     1 1 0]

%G = graph(A);

G = digraph(A);

p = plot(G) %plot handle when you add the p =
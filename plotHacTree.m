function plotHacTree( family, X, attributes, filename )
%PLOTHACTREE Visualize data using modified Okhrins's algorithm. 
%   Data are preprocessed at first and the HAC structure is estimated. If
%   filename parameter is provided the results is saved as pdf.

% Preprocess the data by rotating some attributes
P = hac.preprocess(family, X, 'CML');
X = X * P;

% Uniform the data and fit HAC copula using Okhrin's method
U = pseudoObservations(X);
tree = hac.fit(family, U, 'okhrin');

% Append star to each rotated attributes
for j=1:size(X, 2)
    if P(j,j) == -1
        attributes{j} = sprintf('%s*', attributes{j});
    end      
end

% Plot the tree
if nargin > 3
    hac.plot(family, tree, attributes, filename);
else
    hac.plot(family, tree, attributes);
end

end


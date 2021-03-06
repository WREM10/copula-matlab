function [ tree ] = fit( family, U, method )
%HAC.FIT Fits sample to Hierachical Archimedean Copula. 
%   Returns HAC structure in the form of the tree containing parameters.
%   Supports 2 methods: okhrin and full.
%
%   References:
%       [1] Okhrin. O, Ristig. A, Hierarchical Archimedean Copulae: The HAC
%       Package

% Use Okhrin's method by default
if nargin < 3
   method = 'okhrin';
end

% Assert dataset dimensions
assert(size(U, 2) > 1, 'Number of dimensions must be at least two for HAC.');

% Perform fit of HAC
switch method
case 'full'
    tree = hac.fit.full( family, U );    
case 'okhrin'
    tree = hac.fit.okhrin( family, U );
otherwise
    error('hac:fit:method', 'Fitting method %s not recognized.', method);
end

% Validate generated HAC
valid = hac.valid(tree);
if ~valid
   error('hac:fit:invalid', 'HAC copula is not valid %s.', dprint(tree));   
end

end





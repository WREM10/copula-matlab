function [ Y ] = cdf( copulaparams, U )
%COPULA.CDF Cumulative distribution function of different copula families.

family = copulaparams.family;

switch family
case 'independent'
    Y = prod(U, 2);
case 'gaussian'
    Y = copulacdf(family, U, copulaparams.rho);
case 't'
    Y = copulacdf(family, U, copulaparams.rho, copulaparams.nu);
case {'clayton', 'gumbel', 'frank'}
    Y = archim.cdf(family, U, copulaparams.alpha);
case {'claytonhac', 'gumbelhac', 'frankhac'}
    Y = hac.cdf(family(1:end-3), U, copulaparams.tree);
otherwise
    error('Copula family not recognized.');
end

end


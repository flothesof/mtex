function value = mean(sF, varargin)
% calculates the mean value for an univariate S2Fun or calculates the mean along a specified dimension of a multimodal S2Fun
%
% Syntax
%   value = mean(sF)
%   sF = mean(sF, d)
%
% Input
%  sF - @S2FunHarmonic
%  d - dimension to take the mean value over
%
% Output
%  sF - S2FunHarmonic
%  value - double
%
% Description
%
% If sF is a 3x3 S2Fun then |mean(sF)| returns a 3x3 matrix with the mean
% values of each function mean(sF, 1) returns a 1x3 S2Fun wich contains the
% pointwise means values along the first dimension
%
 
bw = get_option(varargin,'bandwidth',getMTEXpref('maxS2Bandwidth'));
nodes = quadratureS2Grid(bw);

value = mean(sF.eval(nodes),1);

if isalmostreal(value,'componentwise')
  value = real(value);
end


end

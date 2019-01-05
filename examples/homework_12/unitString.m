function displayString = unitString(quantity, name)
%UNITSTRING Display a 1x2 sym with symbolic units
% USAGE: unitString(some_quantity, name)
% OUTPUT:
%   - displayString: char vector containing name, scalar, and units
if nargin < 2
    n = inputname(1);
else
    n = name;
end

[s, U] = separateUnits(quantity);
formatSpec = '%s: %s %s';
displayString = sprintf(formatSpec, n, num2str(double(s)), symunit2str(U));
end
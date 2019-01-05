%% Problem 21.1-3
% In a wetted-wall tower an air- $\textup{H}_2\textup{S}$ mixture is
% flowing by a film of water that is flowing as a thin film down a vertical
% plate. The $\textup{H}_2\textup{S}$ is being absorbed from the air to the
% water at a total pressure of $1.50~\textup{atm abs}$ and $30~\textup{C}$.
% A value for $k_c'$ of $9.567\times 10^{-4}~\textup{m/s}$ has been
% predicted for the gas-phase mass-transfer coefficient. At a given point,
% the mole fraction of $\textup{H}_2\textup{S}$ in the liquid at the
% liquid-gas interface is $2.0(10^{-5})$ and $p_A$ of 
% $\textup{H}_2\textup{S}$ in the gas is $0.05~\textup{atm}$. The Henry's
% law equilibrium relation is $p_A(\textup{atm}) = 609x_A$ (mole fraction
% in liquid). Calculate the rate of absorption of $\textup{H}_2\textup{S}$.
% (_Hint_: Call point 1 the interface and point 2 the gas phase. Then,
% calculate $p_{A1}$ from Henry's law and the given $x_A$. The value of 
% $p_{A2}$ is $0.05~\textup{atm}$.)
%
% The mass transfer coefficient given is $k_c'$, which can be converted to 
% $k_G$ for a flux equation based on partial pressures. 
% $$ k_G = \frac{k_c' P}{RT\cdot p_{BM}} $$
% $$ N_A = k_G(p_{A1} - p_{A2}) $$
u = symunit;
P = 1.5 * u.atm;
T = rewrite(30 * u.Celsius, u.K, 'Temperature', 'absolute');
k_c_prime = 9.567e-4 * u.m / u.s;
x_A1 = 2.0e-5;
p_A1 = 609 * x_A1 * u.atm;
p_A2 = 0.05 * u.atm;
p1 = separateUnits(p_A1); p2 = separateUnits(p_A2); p = separateUnits(P);
p_BM = ((p-p1)-(p-p2))/log((p-p1)/(p-p2)) * u.atm;
R = 8.2057338e-5 * (u.m^3 * u.atm) / (u.mol * u.K);
k_G = (k_c_prime * P) / (R * T * p_BM);
N_A = k_G * (p_A1 - p_A2) * 1e-3 * u.kg;  % convert to kg-mol
disp(unitString(N_A))
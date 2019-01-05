%% Problem 21.3-1
% Using the data and physical properties of Example 21.3-2, calculate the
% flux for a water velocity of $0.152~\textup{m/s}$ and a plate length of 
% $L = 0.137~\textup{m}$. Do not assume that $x_{BM}=1.0$ but actually
% calculate its value. 
%
% The Schmidt and Reynolds numbers can be calculated from the given
% quantities,
u = symunit;
T = rewrite(26.1 * u.Celsius, u.K, 'Temperature', 'absolute');
L = 0.137 * u.m;
v = 0.152 * u.m / u.s;
solubility = 0.02948 * (u.kg * u.mol) / (u.m^3);
D_AB = 1.245e-9 * u.m^2 / u.s;
mu = 8.71e-4 * u.Pa * u.s;
rho = 996 * u.kg / u.m^3;
N_Sc = simplify(mu / (rho * D_AB));
N_Re = simplify((L * v * rho)/mu);
disp(unitString(N_Sc))
disp(unitString(N_Re))
%%
% This value for the Reynolds number corresponds to this equation for mass
% flux,
% $$ J_D = 0.99N_{Re,L}^{-0.5} = \frac{k_c'}{v}\left(N_{Sc}\right)^{2/3} $$
syms k_c_prime;
k_c_prime = solve(0.99*N_Re^-0.5 == (k_c_prime/v)*(N_Sc^(2/3)));
FW_water = 18.02* u.kg / (u.kg * u.mol);
c = rho / FW_water;
x_A1 = 0;
x_A2 = solubility / (solubility + c);
x_BM = (1 - (1 - x_A2))/log(1/(1 - x_A2));
k_c = k_c_prime / x_BM;
N_A = k_c * solubility;
disp(unitString(N_A))
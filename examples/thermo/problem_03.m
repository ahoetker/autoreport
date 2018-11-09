%% Problem 3
% A heat exchanger using cooling water produces steam at
% $2600~\textup{kPa}$ and $723.15~\textup{K}$. The engineer decides to 
% send the steam to a turbine running adiabatically. The turbine has an
% estimated power level of $3800~\textup{kW}$. The steam is exhausted 
% from the turbine as a saturated vapor at $30~\textup{kPa}$. At what 
% rate is steam flowing through the turbine, what is the efficiency?
% (Use Appendix F for steam properties).
%
% The mass flow rate of steam is calculated by finding $\Delta{H}$ around
% the turbine. The temperature at the outlet and the inlet and outlet
% enthalpies are found in a table of superheated steam values. 
% $$ W_s = \dot{m} \Delta{H} $$
% Calculation in MATLAB:
u = symunit;
W_s = 3800 * u.kW;
P_1 = 2600 * u.kPa;
P_2 = 30 * u.kPa;
T_1 = 723.15 * u.K;
H_1 = 3349 * u.kJ / u.kg;
H_2 = 2625.4 * u.kJ / u.kg;
syms m;
m = solve(W_s == m * (H_1 - H_2));
vpa(simplify(m), 5)
%%
% The efficiency of the turbine will be calculated using the equation,
% $$ \eta = \frac{H_2 - H_1}{H_2' - H_1} $$
%
% In order to find $H_2'$, the mole fraction of water in each phase is
% needed. This can be done by assuming an isentropic process,
% $$ S_2' = S_1 $$
% $$ S_2' = (x - 1)S^l + xS^v $$
% $$ H_2' = (x - 1)H^l + xH^v $$
% The entropy and enthalpy values are found in the superheated 
% steam table. 
%
% Calculation in MATLAB:
S_1 = 7.1568 * u.kJ / (u.kg * u.K);
S_2_prime = S_1;  % Assumes isentropic
S_liquid = 0.9441 * u.kJ / (u.kg * u.K);
S_vap = 7.7695 * u.kJ / (u.kg * u.K);
H_liquid = 289.302 * u.kJ / u.kg;
H_vap = H_2;
syms x;
x = solve(S_2_prime == (1 - x)*S_liquid + x*S_vap);
H_2_prime = (1 - x)*H_liquid + x*H_vap;
efficiency = (H_2 - H_1) / (H_2_prime - H_1);
vpa(efficiency, 5)

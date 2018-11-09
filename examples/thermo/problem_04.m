%% Problem 4
% Steam from a power plant is fed to a turbine operating adiabatically. 
% The exhaust from the turbine is condensed to a saturated liquid, which 
% is then pumped to the boiler. You are given that $P_2=8000~\textup{kPa}$,
% $T_2=400~\textup{C}$, $T_4=100~\textup{C}$. Assume the pump operates
% reversibly, and that kinetic and potential energy changes are negligible.
%
% <<problem_04_diagram.png>>
%
% From the data given above, determine the following:
%
% a) What is the thermal efficiency for the Rankine cycle?
%
% The pump operates reversibly, so the work done to the system by the pump,
% $\dot{W}_s$,
% does not change the enthalpy of the steam. Therefore, $H_1=H_4$. The
% heat transfer from the boiler accounts for the change in enthalpy
% between steps 1 and 2, $\dot{Q}_H = H_2 - H_1$. Finally, because the
% turbine operates adiabatically, the difference in enthalpy between steps
% 2 and 3 is due to the shaft work done by the turbine, 
% $\dot{W}_s = H_3 - H_2$. The efficiency of the Rankine cycle is
% therefore, 
% $$ \eta = \frac{\dot{W}_s}{\dot{Q}_H} = \frac{H_3'-H_2}{H_2'-H_1} $$
%
% The enthalpy and entropy data for this problem are taken from a
% superheated steam table. The turbine exhaust quality is found by
% relating entropy between the turbine and condenser. 
%
% Calculation in MATLAB:
u = symunit;
P_2 = 8000 * u.kPa;
T_2 = rewrite(400 * u.Celsius, u.K, 'Temperature', 'absolute'); 
T_4 = rewrite(100 * u.Celsius, u.K, 'Temperature', 'absolute'); 
H_2 = 3141.6 * u.kJ / u.kg;
H_4 = 419.06 * u.kJ / u.kg;
H_1 = H_4;
Q_H = H_2 - H_1;
S_3_prime = 6.3694 * u.kJ / (u.kg * u.K);
S_3_liquid = 1.3069 * u.kJ / (u.kg * u.K);
Delta_S_condensation = 6.04985 * u.kJ / (u.kg * u.K);
syms x;
x = solve(S_3_prime == S_3_liquid + x*Delta_S_condensation);
H_3_liquid = 419.06 * u.kJ / u.kg;
Delta_H_condensation = (2676 * u.kJ/u.kg) - H_4;
H_3_prime = H_3_liquid + x*Delta_H_condensation;
W_s = H_3_prime - H_2;
efficiency = abs(W_s / Q_H);
vpa(efficiency, 5)


%%
%
% b) What is the thermal efficiency of a practical cycle with a turbine 
% efficiency of 0.75?
%
% In this case, the shaft work is reduced by a quarter. The efficiency
% equation is still valid, $$ \eta = \dot{W}_s/\dot{Q}_H $$
%
% Calculation in MATLAB:
W_s_practical = 0.75 * W_s;
eff_practical = abs(W_s_practical / Q_H);
vpa(eff_practical, 5)
%%
% c) What is the quality of the turbine exhaust for the Rankine and 
% practical cycle?
%
% The exhaust quality for the Rankine cycle was found as part of solving
% part a:
fprintf('Turbine exhaust quality (Rankine): %.5f \n', vpa(x));
%%
% To find the exhaust quality for the practical cycle, $H_3$ is calculated
% in terms of the revised shaft work. This is related to the table values
% for enthalpy to find the exhaust quality,
% $$ H_3 = \dot{W}_s + H_2 = H_3^L + x\Delta{H}_{cond} $$
% Calculation in MATLAB:
syms x_practical;
x_practical = solve(W_s_practical + H_2 == ...
    H_3_liquid + x_practical*Delta_H_condensation);
fprintf('Turbine exhaust quality (Practical): %.5f \n', vpa(x_practical));
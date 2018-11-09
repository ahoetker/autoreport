%% Problem 5
% The contents of the freezer in a home refrigerator are maintained at 
% $-20~\textup{C}$. If heat leaks amount to $120,000~\textup{kJ}$ per day, 
% and the cost of electricity is $ $0.08/\textup{kWh}$, estimate the
% yearly cost of running the refrigerator. Assume a coefficient of 
% performance equal to 60% of the Carnot value.
%
% Assuming the temperature in the house is $25~\textup{C}$, the
% refrigeration cycle includes the heat leak as $Q_C$. Therefore, the
% work done by the refrigerator is equal to the heat leak divided by the
% coefficient of performance of the refrigerator. The yearly cost is the
% price of electricity multiplied by this work. 
%
% Calculation in MATLAB:
u = symunit; 
T_C = rewrite(-20 * u.Celsius, u.K, 'Temperature', 'absolute');
T_H = rewrite(25 * u.Celsius, u.K, 'Temperature', 'absolute');
performance_carnot = T_C / (T_H - T_C);
performance = performance_carnot * 0.6;
Q_C = 120000 * u.kJ / u.d;
W = Q_C / performance;
price = 0.08 / u.kWh;
cost = rewrite(W * price, u.year_Gregorian^-1);
fprintf('Cost: $%.2f per year \n', double(separateUnits(cost)))

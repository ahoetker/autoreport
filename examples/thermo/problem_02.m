%% Problem 2
% Derive expressions for $V^R$, $H^R$, $S^R$, and $G^R$ of a gas 
% undergoing an isothermal pressure change using the following EoS:
%
% $$ \frac{P}{RT} = \frac{1}{V} + \frac{AP_r}{VT_r} $$
%
% ------------------------------------------------------------------------
%
% Start by substituting the definition of the reduced properties,
% $$ P_r = \frac{P}{P_c}, ~ T_r = \frac{T}{T_c} $$
% $$ \frac{P}{RT} = \frac{1}{V} + \frac{APT_c}{VTP_c} $$
% $$ \frac{PV}{RT} = 1 + \frac{APT_c}{TP_c} $$
% $$ V = \frac{RT}{P} + \frac{ART_c}{P_c} $$
% The term $RT/P$ is the ideal gas volume, so this equation can be
% substituted into the definition of a residual property,
% $$ V = V^{ig} + V^R $$
% $$ \color{blue} V^R = \frac{ART_c}{P_c} $$
%
% This can be used to find $G^R$,
% $$ \frac{G^R}{RT} = \int_0^P \frac{V^R}{RT}dP $$
% $$ \frac{G^R}{RT} = \int_0^P \frac{ART_c}{RTP_c}dP = \frac{PAT_c}{TP_c} $$
% $$ \color{blue} G^R = \frac{PART_c}{P_c} $$
%
% $$ \frac{H^R}{RT} = -T\left[\frac{\partial{(G^R/RT)}}{\partial{T}}\right]_P $$
% $$ \frac{H^R}{RT} = -T\left[\frac{\partial{(PAT_c/TP_c)}}{\partial{T}}\right]_P = -T\left(-\frac{PAT_c}{T^2P_c}\right) $$
% $$ \frac{H^R}{RT} = \frac{PAT_c}{TP_c} $$
% $$ \color{blue} H^R = \frac{PART_c}{P_c} $$
%
% $$ \frac{S^R}{R} = \frac{H^R}{RT} - \frac{G^R}{RT} $$
% $$ \frac{S^R}{R} = \frac{PAT_c}{TP_c} - \frac{PAT_c}{TP_c} = 0 $$
% $$ \color{blue} S^R = 0 $$
%%
% Would methanol or ethanol behave more like an ideal gas?
%
% A gas behaves ideally when $PV/RT = 1$. Given the above EoS, a gas will
% behave more like an ideal gas as the ratio of reduced pressure to reduced
% temperature decreases. By the definition of these reduced properties, the same
% pattern holds for the ratio of critical temperature to critical pressure.
% This ratio can be computed for methanol and ethanol by referencing a 
% gas properties table.
%
% Calculation in MATLAB:
T_c_methanol = 512.6;
P_c_methanol = 80.97;
T_c_ethanol = 513.9;
P_c_ethanol = 61.48;
fprintf('T_c/P_c for methanol: %.5f, ethanol: %.5f \n', ...
    T_c_methanol/P_c_methanol, T_c_ethanol/P_c_ethanol);
%%
% The ratio is smaller for methanol, therefore methanol behaves more like
% an ideal gas.
%% Problem 21.2-1
% A fluid is flowing in a vertical pipe and mass tranfer is occurring from
% the pipe wall to the fluid. Relate the convective mass-transfer
% coefficient $k_c'$ to the variables $D$, $\rho$, $\mu$, $v$, $D_{AB}$,
% $g$, and $\Delta{\rho}$, where $D$ is pipe diameter, $L$ is pipe length,
% and $\Delta{\rho}$ is the density difference. 
%
% According to Buckingham's pi theorem, given nine independent variables
% in three physical dimensions, there are six $\pi-$ groups to construct.
%
% Vector order: [Length Mass time]
D = [1 0 0];
L = [1 0 0];
rho = [-3 1 0];
mu = [-1 1 -1];
v = [1 0 -1];
D_AB = [2 0 -1];
g = [1 0 -2];
delta_rho = [-3 1 0];
k_c_prime = [1 0 -1];

pi_1 = ([D' rho' mu']\-k_c_prime')'
%%
% $\pi_1 = \frac{D \rho k_c'}{\mu}$

pi_2 = ([D' rho' mu']\-v')'
%%
% $\pi_2 = \frac{D \rho v}{\mu}$

pi_3 = ([D' rho' mu']\-D_AB')'
%%
% $\pi_3 = \frac{\rho D_{AB}}{\mu}$

pi_4 = ([D' rho' mu']\-g')'
%%
% $\pi_4 = \frac{D^3 \rho^2 g}{\mu^2}$

pi_5 = ([D' rho' mu']\-delta_rho')'
%%
% $\pi_5 = \frac{\Delta\rho}{\rho}$

pi_6 = ([D' rho' mu']\-L')'
%%
% $\pi_6 = \frac{L}{D}$

%%
% These dimensionless groups can be combined to describe the system. This
% combination was done pencil-and-paper with a lot of frustration, and the
% results are shown here. 
%
% <latex>
% \[ \frac{\pi_1}{\pi_3} = f\left(\pi_4 \pi_5 \pi_6^3, \pi_2,
% \pi_3^{-1}\right) \]
% \[ \frac{k_c'D}{D_{AB}}=f\left(\frac{gL^3\rho\Delta\rho}{\mu^2},
% \frac{Dv\rho}{\mu},\frac{\mu}{\rho D_{AB}}\right) \]
% </latex>
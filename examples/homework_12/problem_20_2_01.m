%% Problem 20.2-1
%
% <latex>
% Solute A is diffusing at unsteady state into a semi-infinite medium of
% pure B and undergoes a first-order reaction with B. Solute A is
% dilute. Calculate the concentration $c_A$ at points z = 0, 4, and
% $10~\textup{mm}$ from the surface for $t=1\times 10^5~\textup{s}$.
% Physical property data are $D_{AB}=1\times
% 10^{-9}~\textup{m}^2/\textup{s}$, $k'=1\times 10^{-4}~\textup{s}^{-1}$,
% $c_{A0} = 1.0~\textup{kg mol/m}^3$. Also calculate the
% $\textup{kg mol absorbed/m}^2$.
% The concentration of A at point z is given by \vref{conc_empirical_1} 
% (corrected version),
% \begin{equation} \label{conc_empirical_1}
% \begin{split}
% \frac{C_A}{C_{A0}}=&\frac{1}{2}\exp\left(-z\sqrt{k'/D_{AB}}\right)
%  * \textup{erfc}\left(\frac{z}{2\sqrt{tD_{AB}}}-\sqrt{k't}\right) \\
%  &+ \frac{1}{2}\exp\left(z\sqrt{k'/D_{AB}}\right)
%  * \textup{erfc}\left(\frac{z}{2\sqrt{tD_{AB}}}+\sqrt{k't}\right)
% \end{split}
% \end{equation}
% \Vref{conc_empirical_1} was incorrect in the textbook, and has
% been modified according to the instructor's email.
% </latex>
% 
u = symunit;
t = 1e5 * u.s;
D_AB = 1e-9 * u.m^2 / u.s;
k_prime = 1e-4 * u.s^-1;
C_A0 = 1.0 * (u.kg * u.mol) / (u.m^3);
C_A = @(z) C_A0 * ...
    (0.5*exp(-z*sqrt(k_prime/D_AB))*erfc((z/(2*sqrt(t*D_AB))) - sqrt(k_prime*t)) + ...
    0.5*(exp(z*sqrt(k_prime/D_AB)))*erfc((z/(2*sqrt(t*D_AB))) + sqrt(k_prime*t)));
disp(unitString(C_A(0), 'C_A (0 mm)'))
disp(unitString(C_A(0.004 * u.m), 'C_A (4 mm)'))
disp(unitString(C_A(0.010 * u.m), 'C_A (10 mm)'))
%%
% <latex>
% The amount of A absorbed per square meter is given by 
% \vref{conc_empirical_2} (corrected version),
% \begin{equation} \label{conc_empirical_2}
% Q=C_{A0}\sqrt{D_{AB}/k'}\left[\left(k't+\frac{1}{2}\right)\textup{erf}\sqrt{k't}+\sqrt{k't/\pi} e^{-k't}\right]
% \end{equation}
% </latex>
Q = C_A0*sqrt(D_AB/k_prime)*((k_prime*t+0.5)*erf(sqrt(k_prime*t) + ...
    sqrt((k_prime*t)/pi)*exp(-k_prime*t)));
disp(unitString(Q))


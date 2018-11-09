%% Problem 1
% A gas you are studying can be described by the following EoS:
%
% $$ Z = 2 + 3P = \frac{PV}{RT} $$
%
% Using Maxwell's equations and equation 6.31, express
% $\left(\frac{\partial{G}}{\partial{V}}\right)_T$ in terms of $P$, $V$,
% $R$, and $T$.
%
% ------------------------------------------------------------------------
%
% An equation for $G$ is constructed by rearranging two thermodynamic
% relationships, then taking the partial differential,
%
% $$ G \equiv H - TS $$
% $$ H \equiv U + PV $$
% $$ G = U + PV - TS $$
% $$ \left(\frac{\partial{G}}{\partial{V}}\right)_T = 
% \left(\frac{\partial{U}}{\partial{V}}\right)_T + 
% \left(\frac{\partial{PV}}{\partial{V}}\right)_T - 
% \left(\frac{\partial{TS}}{\partial{V}}\right)_T $$
% The first term in this equation can be substituted for equation 6.31, and
% the remaining terms evaluated,
%
% $$ \left(\frac{\partial{U}}{\partial{V}}\right)_T = T\left(\frac{\partial{P}}{\partial{T}}\right)_V - P $$
% $$ \left(\frac{\partial{G}}{\partial{V}}\right)_T = T\left(\frac{\partial{P}}{\partial{T}}\right)_V - P + P - T\left(\frac{\partial{S}}{\partial{V}}\right)_T $$
% $$ \left(\frac{\partial{G}}{\partial{V}}\right)_T = T\left(\frac{\partial{P}}{\partial{T}}\right)_V - T\left(\frac{\partial{S}}{\partial{V}}\right)_T $$
% The right side of this equation is one of Maxwell's equations,
%
% $$ \left(\frac{\partial{P}}{\partial{T}}\right)_V = \left(\frac{\partial{S}}{\partial{V}}\right)_T $$
% $$ \color{blue} \left(\frac{\partial{G}}{\partial{V}}\right)_T = 0 $$
%

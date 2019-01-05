%% Problem 21.1-2
% Prove or show the following relationships, starting with the flux
% equations:
%
% <latex>
% \subsection{Part a}
% Convert $k_c'$ to $k_y$ and $k_G$.
% </latex>
%
% The flux equations involving these coefficients are,
% $$ N_A = k_c(C_{A1}-C_{A2}) = k_G(p_{A1}-p_{A2}) = k_y(y_{A1}-y_{A2}) $$
% the conversion between $k_c'$ and $k_c$ is given in the flux equation for
% A diffusing through stagnant, non-diffusing B,
%
% <latex>
% \[N_A = \frac{k_c'}{x_{BM}}\left(C_{A1}-C_{A2}\right) =
% k_c\left(C_{A1}-C_{A2}\right)\]
% \[ k_c = \frac{k_c'}{x_{BM}} = \frac{k_c' P}{p_{BM}} \]
% \[ k_y = \frac{k_c' P}{p_{BM}}\cdot\frac{C_{A1}-C_{A2}}{y_{A1}-y_{A2}} = \frac{k_c' P}{RT\cdot y_{BM}} \]
% \[ k_G = \frac{k_c' P}{p_{BM}}\cdot\frac{C_{A1}-C_{A2}}{p_{A1}-p_{A2}} = \frac{k_c' P}{RT\cdot p_{BM}} \]
% </latex>
%%
% <latex>
% \subsection{Part b}
% Convert $k_L$ to $k_x$ and $k_x'$.
% </latex>
%
% The flux equations involving these coefficients are,
% $$ N_A = k_L(c_{A1}-c_{A2}) = k_x(x_{A1}-x_{A2}) $$
% A relationship for $k_x$ can be found by substituting $x=c_{A}/c$,
% $$ k_x = k_L\frac{c_{A1}-c_{A2}}{x_{A1}-x_{A2}} = 
% k_L\frac{c_{A1}-c_{A2}}{\frac{c_{A1}}{c}-\frac{c_{A2}}{c}} = k_L\cdot c $$
% $$ k_x' = k_x\cdot x_{BM} = k_L \cdot c \cdot x_{BM} $$
% 
%%
% <latex>
% \subsection{Part c}
% Convert $k_G$ to $k_y$ and $k_c$.
% </latex>
%
% The flux equations involving these coefficients are,
% $$ N_A = k_G(p_{A1}-p_{A2}) = k_y(y_{A1}-y_{A2}) = k_c(C_{A1}-C_{A2}) $$
% By substituting $p_A=y_A P$, 
% $$ k_y = k_G\frac{p_{A1}-p_{A2}}{y_{A1}-y_{A2}} = 
% k_G\frac{y_{A1}P-y_{A2}P}{y_{A1}-y_{A2}} = k_G\cdot P $$
% Finally, substituting $C=P/RT$,
% $$ k_c = k_G\frac{p_{A1}-p_{A2}}{C_{A1}-C_{A2}} =
% k_G\frac{p_{A1}-p_{A2}}{(p_{A1}-p_{A2})/RT} = k_G \cdot RT $$
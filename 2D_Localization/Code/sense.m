function [ q ] = sense(P, Z, world)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% P is Prior Probability                                           %%
% Z is Measurement                                                 %%
% world is cyclic                                                  %%

P_Hit = 0.6; % Correct Measurement
P_Miss = 0.2; % Incorrect Measurement

[m, n] = size(P); 
q = ones(m, n);

for i = 1:m
    for j = 1:n
        if strcmp(Z,world(i,j)) % String Comparison of measurement and world
           q(i,j)=P_Hit*P(i,j); % for measurement and world has same color
        else
            q(i,j)=P_Miss*P(i,j); % for measurement and world has different color
        end
    end
    
end
q = q / sum(q(:)); % Normalization
end
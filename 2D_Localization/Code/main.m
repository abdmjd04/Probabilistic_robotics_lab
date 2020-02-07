% 2D Localization

N = 3;
world = ['G','G','G';
          'G','R','R';
          'G','G','G'];

P = ones(N, N) ./ (N*N); % Prior Probability

Z = {'R'}; % Measurement
q = P;

for i = 1:length(Z)
    q = sense(q,Z(i),world); % sense
end
q = move(q,1,0); % move down
%q = move(q,0,1); % Right
%q = move(q,-1,0); % Up
%q = move(q,0,-1); %left
    
%Uncomment to view in 2d grid     
%subplot(2,2,2)
%imagesc(P); 
%title('Prior Probability');

subplot(2,2,1)
bar(P); 
title('Prior Probability');

%subplot(2,2,4)
%imagesc(q); 
%title('Posterior Probability');

subplot(2,2,3)
bar(q);
title('Posterior Probability');

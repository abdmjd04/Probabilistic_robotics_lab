function [q] = move(P,u,v)
 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 % P is prior probability                                         %%
 % u is horizonal move                                            %%
 % v is vertical move                                             %%
 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 
 P_Correct = 0.8; % Correct motion
 P_OverShoot = 0.1; % Overshoot
 P_UnderShoot = 0.1; % Undershoot
 
 if v == 0 % in order to moves horizontally
         q = P_Correct * circshift(P,[u,v]);
         q = q + P_OverShoot * circshift(P,[u+1,0]);
         q = q +  P_UnderShoot * circshift(P,[u-1,0]);
 elseif u == 0 % in order to moves vertically
         q = P_Correct * circshift(P,[u,v]);
         q = q + P_OverShoot * circshift(P,[0,v+1]);
         q = q + P_UnderShoot * circshift(P,[0,v-1]);
 end
 
end
       
% For 1D 
% pCorrect = 0.8;
% pOverShoot = 0.1;
% pUnderShoot = 0.1;
% 
% q_correct = pCorrect * circshift(p,u);
% q_over =  pOverShoot * circshift(p,u+1);
% q_under = pUnderShoot * circshift(p,u-1);
% 
% q = q_correct + q_over + q_under;


% if  u == 0;
%     q = p;
% elseif u == 1;
%     %q = circshift(p,ones(1,length(p)))
%     q = circshift(p,1)
%     
% else u == -1;
%     %q = circshift(p,-1*ones(1,length(p)))
%      q = circshift(p,-1)
%end
%end
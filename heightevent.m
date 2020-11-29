function [value,isterminal,direction]  = heightevent(t,y)
%HEIGHTEVENT Set of options such that integration stops when hoirzontal
%           displacemnt is zero.
value = y(1);% y(3) is vertical displacement so we require this term to be zero

isterminal = 1;% Isterminal of 1 means integration stops when y(3) is zero

direction = 1; % As y(1) is a inreasing function.
              

function [value,isterminal,direction]  = horzevent(t,y)
%HORZEVENT  Set of options such that integration stops when vertical
%           displacemnt is zero.

value = y(3);% y(3) is vertical displacement so we require this term to be zero

isterminal = 1;% Isterminal of 1 means integration stops when y(3) is zero

direction = -1;% As y(3) is a decreasing function before we find y(3) zero
               % This stops ode45 stoppping at t=0 as y(3) is zero
               % initally.

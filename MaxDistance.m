function [d] = MaxDistance(angle)
%MAXDISTANCE    Takes an angle and returns the horizontal distance for
%               an object of mass m, inital speed v0, drag coefficent K
%               would travel. Returns the value as a negative so it can be
%               used in fminbnd easier.

%Parameters
m = 6; v0 = 450; K = 0.00002; g = 9.8;

%Options for ode45 to stop integrating when vertical displacement is zero.
options = odeset('Events',@horzevent);

% ODE system to solve
%y(1)= distance in horizontal direction from orgin
%y(2)=dy(1)/dt, speed in horizontal direction
%y(3)= distance in vertical direction from orgin
%y(4)=dy(3)/dt, speed in vertical direction
f = @(t, y) [y(2); (-K/m)*sqrt(y(2)^2+y(4)^2)*y(2); y(4); -g - (K/m)*sqrt(y(2)^2 + y(4)^2)*y(4)];

% Initial conditions
ic = [0; 450*cos(angle); 0; 450*sin(angle)];

% Solve ode using ode45
[t, displacement] = ode45(f, [0 2*v0*sin(angle)/g], ic, options); 
d=-displacement(end,1);
end
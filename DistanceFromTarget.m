<<<<<<< Updated upstream
function [d] = DistanceFromTarget(angle)
%DISTANCEFROMTARGET Takes an angle and returns the horizontal distance for
%                   an object of mass m, inital speed v0 and drag coefficent 
%                   K is from a target of 15000m. Can change where the target
%                   is by changing the first inital condition.

%parameters 
m = 6; v0 = 450; K = 0.00002; g = 9.8;

%Options for ode45 to stop integrating when vertical displacement is zero.
options = odeset('Events',@horzevent);

% ODE system to solve, same as before.
f = @(t, y) [y(2); (-K/m)*sqrt(y(2)^2+y(4)^2)*y(2); y(4); -g - (K/m)*sqrt(y(2)^2 + y(4)^2)*y(4)];

% Initial conditions, same as before other than for y(1)
ic = [-15000; 450*cos(angle); 0; 450*sin(angle)];

% Solve ode using ode45
[t, displacement] = ode45(f, [0 2*v0*sin(angle)/g], ic, options); 
d=displacement(end,1);
=======
function [d] = DistanceFromTarget(angle)
%DISTANCEFROMTARGET Takes an angle and returns the horizontal distance for
%                   an object of mass m, inital speed v0 and drag coefficent 
%                   K is from a target of 15000m. Can change where the target
%                   is by changing the first inital condition.

%parameters 
m = 6; v0 = 450; K = 0.00002; g = 9.8;

%Options for ode45 to stop integrating when vertical displacement is zero.
options = odeset('Events',@horzevent);

% ODE system to solve, same as before.
f = @(t, y) [y(2); (-K/m)*sqrt(y(2)^2+y(4)^2)*y(2); y(4); -g - (K/m)*sqrt(y(2)^2 + y(4)^2)*y(4)];

% Initial conditions, same as before other than for y(1)
ic = [-15000; 450*cos(angle); 0; 450*sin(angle)];

% Solve ode using ode45
[t, displacement] = ode45(f, [0 2*v0*sin(angle)/g], ic, options); 
d=displacement(end,1);
>>>>>>> Stashed changes
end
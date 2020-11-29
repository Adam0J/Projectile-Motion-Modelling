function [d] = FiringTimes(angle)
%HEIGHTATBARRIER    Takes an angle of a cannonball projection that hits a
%                   target, gives firing times such when interceptors
%                   present the cannonabll will still hit the target.
%                   Cannonball has mass m, inital speed v0, drag 
%                   coefficent K. The interceptors X coordinate is 12000m. 

%Parameters
m = 6; v0 = 450; K = 0.00002; g = 9.8;

%Options for ode45 to stop integrating when vertical displacement is zero.
options = odeset('Events',@heightevent);

% ODE system to solve, same as before.
f = @(t, y) [y(2); (-K/m)*sqrt(y(2)^2+y(4)^2)*y(2); y(4); -g - (K/m)*sqrt(y(2)^2 + y(4)^2)*y(4)];

% Initial conditions, same as before other than for y(1)
ic = [-12000; 450*cos(angle); 0; 450*sin(angle)];

% Solve ode using ode45
[t, displacement] = ode45(f, [0 2*v0*sin(angle)/g], ic, options); 

%Height and time of cannonball mod 2000 and 20 respectively.
height=mod(displacement(end,3),2000); 
time=mod(t(end),20);

%Height of interceptors
BottomInterceptor=time*100;

%Possible lauch times
d=[0,(height-BottomInterceptor)/100];
end
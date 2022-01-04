%   Initialisation Phase

clear; clf;
%Delete all children and clear all

rng(380);
%specific seed for the MATLAB random number generator

CruisingSpeed = 820;
%the cruising speed of the aircraft (specifically of an A330-300) in km/h

graphX = 50;
graphY = 25;
% dimensions of the graph

WindX = Wind_Data(graphX,graphY);
WindY = Wind_Data(graphX,graphY);
%wind map generation values, calling the Wind_Data subscript.

[gridX,gridY] = meshgrid(0:graphX,0:graphY);
hq = quiver(gridX,gridY,WindX,WindY,'k');
%forming the grid starting from 0 x value to graphX, and 0 y value to
%graphY, using the values provided above
hold on;
%keep this current plotting when other plots will be added on top of this

xlabel('Units = 22.36 [km], Total Distance: 1118.3km');
ylabel('PORTI to XETBO Latitude');
axis equal tight
plot([0 graphX],[graphY graphY]/2,'k.','markersize',16)

%% Coloring Wind_Data/Wind Map

P = (sqrt((gridX-graphX).^2 + (gridY-graphY/2).^2));
Preffered = ((graphX-gridX).*WindX +  (graphY/2-gridY).*WindY)./P; 
Preffered(~isfinite(Preffered)) = 0;
%calculates whether the wind is preffered or not
%ideal tailwind will turn cyan
%unwanted headwind will be red

hold on;
hold_im = imagesc(Preffered);
%designated background

set(hold_im,'Xdata',[0 graphX],'Ydata',[0 graphY]);
uistack(hold_im,'bottom');

% Change the colormap...
colormap(interp1([0,1,2],[0 0 1; 1 1 1; 0 1 1],0:0.01:2));
caxis(max(abs(Preffered(:)))*[-1 1]); 

%% Creating WayPoints(WP)

numWP = 5;
%create number of way points (does not include start and finish)

WPX = linspace(0,graphX,numWP+2)';
WPY = graphY/2 * ones(numWP+2,1);
%now equally plot them over the graph if necessary adjusting WP count.

h_wp = plot(WPX,WPY,'color','k','linestyle','none','marker','.','markersize',16);
%plot wps

%% Using the previously created wps, form a path from the starting
%wp to finish using the Straight_Line function

WPsOnPath = Straight_Line([WPX,WPY],'linear',graphX,graphY,101);
h_line = plot(WPsOnPath(:,1),WPsOnPath(:,2),'k','linewidth',2);

%% Using the straight line formation from the previous section, compute
%the amount of time it takes to reach

Straight_Line_Time = Time_Calculator(WPsOnPath,WindX,WindY,CruisingSpeed);

fprintf('Time took to traverse the great circle distance: %d hours, %.1f minutes\n',floor(Straight_Line_Time),rem(Straight_Line_Time,1)*60);

%% FMINCON Algorithm

%the setup below belongs to the Optimisation toolbox, only the variables
%from the previous sections were added, if you like to check more on this
%visit the optimisation toolbox page.
objectiveFun = @(P) Time_Calculator(P,WindX,WindY,CruisingSpeed,graphX,graphY,'pchip');

% FMINCON Optimisation options
opts = optimset('fmincon');
opts.Display = 'iter';
opts.Algorithm = 'active-set';
opts.MaxFunEvals = 2000;

%initilise variables
WPX = linspace(0,graphX,numWP+2)';
WPY = graphY/2 * ones(numWP+2,1);
ic = [WPX(2:end-1)'; WPY(2:end-1)'];
ic = ic(:);

lb = zeros(size(ic(:)));
ub = reshape([graphX*ones(1,numWP); graphY*ones(1,numWP)],[],1);

%fmincon used from the optimisation toolbox
optimalWP = fmincon(objectiveFun, ic(:), [],[],[],[],lb,ub,[],opts);

delete([h_wp h_line]);
optimalWP = [0 graphY/2; reshape(optimalWP,2,[])'; graphX graphY/2];

WPX = optimalWP(:,1);
WPY = optimalWP(:,2);
h_wp = plot(WPX,WPY,'color','k','linestyle','none','marker','.','markersize',16);

%using the optimisation technique and interpolation
WPsOnPath = Straight_Line([WPX,WPY],'pchip',graphX,graphY,101);
h_line = plot(WPsOnPath(:,1),WPsOnPath(:,2),'k','linewidth',2);
Optimal_Time = Time_Calculator(WPsOnPath,WindX,WindY,CruisingSpeed);
fprintf('Time took to traverse the optimal route: %d hours, %.1f minutes\n',floor(Optimal_Time),rem(Optimal_Time,1)*60);

%calculate how much time was saved
Optimised_Time = Straight_Line_Time - Optimal_Time;
fprintf('Saved: %.1f minutes\n',rem(Optimised_Time,1)*60);

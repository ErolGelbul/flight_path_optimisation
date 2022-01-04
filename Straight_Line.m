function WPsOnPath = Straight_Line(p,METHOD,graphX,graphY,fineness)
% Interpolate the curve based on the discrete waypoints to generate a
% continuous path.

nP = size(p,1);
WPsOnPath = [interp1(1:nP,p(:,1),linspace(1,nP,fineness)',METHOD,'extrap') interp1(1:nP,p(:,2),linspace(1,nP,fineness)',METHOD,'extrap')];

WPsOnPath(:,1) = min(WPsOnPath(:,1),graphX);
WPsOnPath(:,1) = max(WPsOnPath(:,1),0);
WPsOnPath(:,2) = min(WPsOnPath(:,2),graphY);
WPsOnPath(:,2) = max(WPsOnPath(:,2),0);

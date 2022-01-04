function TimeTook = Time_Calculator(WPsOnPath,W_x,WindY,CruisingSpeed,graphX,graphY,METHOD)

if isvector(WPsOnPath)
    WPsOnPath = [0 graphY/2; reshape(WPsOnPath,2,[])'; graphX graphY/2];
    WPsOnPath = Straight_Line(WPsOnPath,METHOD,graphX,graphY,101);
end

dP = diff(WPsOnPath);

% Interpolation
V_wind = [interp2(W_x,WPsOnPath(1:end-1,1)+1,WPsOnPath(1:end-1,2)+1,'linear') interp2(WindY,WPsOnPath(1:end-1,1)+1,WPsOnPath(1:end-1,2)+1,'*linear')];

% depending on the tailwind and headwind dot product their effect
V_add = (sum(V_wind.*dP,2))./sqrt(sum(dP.^2,2));
dx = sqrt(sum(dP.^2,2))*22.36; 
dt = dx./(CruisingSpeed+V_add);
TimeTook = sum(dt);
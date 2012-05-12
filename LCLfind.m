function [Tlcl,plcl]=LCLfind(wv,T,p);
%   in: wv = vapor mixing ratio in kg/kg
%       T  = temperature in Kelvin
%       p  = pressure in Pa
%  out: Tlcl, pcl = temperature and pressure at the LCL in K,Pa
%
%   Reference: Emanuel 4.6.24 p. 130 and 4.6.22 p. 129
    c=constants;
    e=wv*p/(c.eps + wv);
    ehPa=e*0.01; %Bolton's formula requires hPa
    % this is is an empircal fit from for LCL temp
    % from Bolton, 1980
    Tlcl=(2840./(3.5*log(T) - log(ehPa) - 4.805)) + 55.;
    cp=c.cpd + wv*c.cpv;
    logplcl=log(p) + cp./(c.Rd*(1 + wv/c.eps))*log(Tlcl./T);
    plcl=exp(logplcl);
end
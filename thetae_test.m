function [temphandle,wvhandle]=thetae_test;
    numpress=50;
    numtheta=60;
    thetae0=linspace(280,340,numtheta);
    wT0=10.e-3;
    press=linspace(2.e4,10.e4,numpress);
    out_temp=NaN([numpress,numtheta]);
    out_wv=NaN([numpress,numtheta]);
    for i=1:numpress;
      for j=1:numtheta;
        rowcol=[i,j]
        [Tcloud,wvCloud,wlCloud]=tinvert_thetae(thetae0(j),wT0, ...
                                                press(i));
        out_temp(i,j)=Tcloud;
        out_wv(i,j)=wvCloud;
      end
    end
    temphandle=figure(1);
    clf;
    contourf(thetae0,press*1.e-2,out_temp);
    xlabel('thetae (K)')
    ylabel('pressure (hPa)')
    title('Temperture (K) for wT=10 g/kg')
    colorbar;
    print -dpng -r150 temp.png;
    wvhandle=figure(2);
    clf;
    contourf(thetae0,press*1.e-2,out_wv*1.e3);
    xlabel('thetae (K)','fontsize',26);
    ylabel('pressure (hPa)');
    title('vapor mixing ratio (g/kg) for wT=10 g/kg');
    colorbar;
    print -dpng -r150 wv.png;
end



function z=fun(h,i)
ru=1190;c=1464;k=0.2;a=k/ru/c;      %���Բ���
global SteadyFrame TLCFrame TLCTime dt Tr T0 TLCTemp
Tw=TLCTemp(i);
time=TLCTime(i);
EndFrame=min(TLCFrame(i),SteadyFrame)-1;
Duh=sum((1-exp(h.^2.*a.*(time-(2:EndFrame).*dt)./k^2) ...
              .*erfc(h.*sqrt(a.*(time-(2:EndFrame).*dt))/k)).*(Tr(i,2:EndFrame)-Tr(i,(1:EndFrame-1))));  
z=Tw-T0-Duh;
end
%��Duhamel���ӵõ��ĵ��ȷ��̵Ĳв�
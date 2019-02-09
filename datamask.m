%屏蔽不处理的点
Defect_Hole=zeros(CalS,1);                       %Defect_Hole，记录溢流孔处的点
for i=1:12
      d=(X-holecenter(i,1)).^2+(Y-holecenter(i,2)).^2;
      Defect_Hole=Defect_Hole+logical(d<100);    %半径约为10
end
Defect=Defect_Hole+Defect_Hue;                   %Defect_Hue，记录Hue值始终不在有效区域内的点
Defect=logical(Defect);
Nu_Raw(Defect)=NaN;                             
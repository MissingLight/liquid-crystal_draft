%���β�����ĵ�
Defect_Hole=zeros(CalS,1);                       %Defect_Hole����¼�����״��ĵ�
for i=1:12
      d=(X-holecenter(i,1)).^2+(Y-holecenter(i,2)).^2;
      Defect_Hole=Defect_Hole+logical(d<100);    %�뾶ԼΪ10
end
Defect=Defect_Hole+Defect_Hue;                   %Defect_Hue����¼Hueֵʼ�ղ�����Ч�����ڵĵ�
Defect=logical(Defect);
Nu_Raw(Defect)=NaN;                             
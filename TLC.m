%ͨ��Hue�õ�������˲̬Һ����ȡ�¶ȵ�ֵ�Ͷ�Ӧʱ��
tic
global TLCFrame TLCTime TLCTemp
X=reshape(repmat(1:CalX,CalY,1),CalX*CalY,1);
Y=repmat((1:CalY)',CalX,1);                                  %[X,Y]��¼�˼����������е������
CalS=CalX*CalY;                                              %�ܼ���ڵ���
Hue2D=reshape(Hue,CalS,FrameNum);                            %Hue������άת��ά
% Hue2D�ĺ��壺��[X,Y,Hue2D]����1��x����2��y����3���ڣ�FrameNum+2�������μ�¼��Ӧ�㴦�ڵ�1����FrameNum֡��Hueֵ
J=logical(Hue2D>100&Hue2D<130);                              %�ҳ����е��ڱ궨������Ч�����ڵ�����Hue�Ķ�Ӧ֡��
J_lr=fliplr(J);                                              %���ҷ�ת
Hue1D=sum(cumsum(J_lr~=0,2)==0,2)+1;                         %�ҳ�J_lrÿһ�е�һ������Ԫ�أ�1������Jÿһ�����һ��1
Defect_Hue=logical(Hue1D>size(J_lr,2));                      %��¼�쳣���λ�ã���Hueֵʼ�ղ�����Ч�����ڵĵ�
Hue1D(Defect_Hue)=1;                                         %Ϊ�˲�������ʱ��ֵ��֮������Σ�Ӧ���и��õĽ������
TLCFrame=(FrameNum+1)-Hue1D;                                 %�õ���Ч�����ڵ����һ֡��ԭ���ɫ��-�¶ȣ�ʱ�䣩����
TLCTime=TLCFrame/vidObj.FrameRate;                           %�õ�˲̬Һ�����¶Ȳɼ�ʱ�̾����У�
TLCt2H=[(1:CalS)',TLCFrame];
TLCHue=arrayfun(@(r,c)Hue2D(r,c),TLCt2H(:,1),TLCt2H(:,2));   %�õ���Ӧʱ�̵�Hue�����У�
Cali=xlsread('TLC_valid.xls');                               %����궨���ݣ���Hue��Ч���䣩
p=polyfit(Cali(:,2),Cali(:,1),3);                            %����ʽ��С�������
TLCTemp=polyval(p,TLCHue);                                   %�õ���Ӧʱ�̵��¶Ⱦ����У�
toc
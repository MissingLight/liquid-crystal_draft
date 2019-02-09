%通过Hue得到各点用瞬态液晶读取温度的值和对应时间
tic
global TLCFrame TLCTime TLCTemp
X=reshape(repmat(1:CalX,CalY,1),CalX*CalY,1);
Y=repmat((1:CalY)',CalX,1);                                  %[X,Y]记录了计算域内所有点的坐标
CalS=CalX*CalY;                                              %总计算节点数
Hue2D=reshape(Hue,CalS,FrameNum);                            %Hue矩阵三维转二维
% Hue2D的含义：对[X,Y,Hue2D]，第1列x，第2列y，第3到第（FrameNum+2）列依次记录相应点处在第1到第FrameNum帧的Hue值
J=logical(Hue2D>100&Hue2D<130);                              %找出所有点在标定曲线有效区域内的所有Hue的对应帧数
J_lr=fliplr(J);                                              %左右翻转
Hue1D=sum(cumsum(J_lr~=0,2)==0,2)+1;                         %找出J_lr每一行第一个非零元素（1），即J每一行最后一个1
Defect_Hue=logical(Hue1D>size(J_lr,2));                      %记录异常点的位置，即Hue值始终不在有效区域内的点
Hue1D(Defect_Hue)=1;                                         %为了不报错临时赋值，之后会屏蔽，应该有更好的解决方法
TLCFrame=(FrameNum+1)-Hue1D;                                 %得到有效区域内的最后一帧，原因见色相-温度（时间）曲线
TLCTime=TLCFrame/vidObj.FrameRate;                           %得到瞬态液晶的温度采集时刻矩阵（列）
TLCt2H=[(1:CalS)',TLCFrame];
TLCHue=arrayfun(@(r,c)Hue2D(r,c),TLCt2H(:,1),TLCt2H(:,2));   %得到对应时刻的Hue矩阵（列）
Cali=xlsread('TLC_valid.xls');                               %导入标定数据（仅Hue有效区间）
p=polyfit(Cali(:,2),Cali(:,1),3);                            %多项式最小二乘拟合
TLCTemp=polyval(p,TLCHue);                                   %得到对应时刻的温度矩阵（列）
toc
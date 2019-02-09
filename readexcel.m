global SteadyFrame Tr T0
holecenter=xlsread('hole_center');               %12个溢流孔的圆心坐标
LabData=xlsread('10000.xlsx');                   %Labview数据
LabTr=LabData(129:1757,[23 23 8 6 22 3 2 7 7]);  %参考温度，左右顺序与视频对应；7个热电偶，9个差值点
SteadyFrame=600;                                 %参考温度较快达到峰值后稳定，稳定后Duhamel叠加项基本为零，可以略去（待定）
LabTr_T=LabTr';                                  
X_std=8*X/CalX+1;                                %热电偶沿x方向分布，所以将（1：CalX）一一映射到（1：9）
Tr=interp1(LabTr_T,X_std,'linear');              %先近似等分插值，以后改成根据分界点（热电偶）的位置带权插值
T0=mean(LabData(1,[23 8 6 22 3 2 7]));           %室温，求法多样
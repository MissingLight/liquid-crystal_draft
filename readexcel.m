global SteadyFrame Tr T0
holecenter=xlsread('hole_center');               %12�������׵�Բ������
LabData=xlsread('10000.xlsx');                   %Labview����
LabTr=LabData(129:1757,[23 23 8 6 22 3 2 7 7]);  %�ο��¶ȣ�����˳������Ƶ��Ӧ��7���ȵ�ż��9����ֵ��
SteadyFrame=600;                                 %�ο��¶ȽϿ�ﵽ��ֵ���ȶ����ȶ���Duhamel���������Ϊ�㣬������ȥ��������
LabTr_T=LabTr';                                  
X_std=8*X/CalX+1;                                %�ȵ�ż��x����ֲ������Խ���1��CalX��һһӳ�䵽��1��9��
Tr=interp1(LabTr_T,X_std,'linear');              %�Ƚ��Ƶȷֲ�ֵ���Ժ�ĳɸ��ݷֽ�㣨�ȵ�ż����λ�ô�Ȩ��ֵ
T0=mean(LabData(1,[23 8 6 22 3 2 7]));           %���£��󷨶���
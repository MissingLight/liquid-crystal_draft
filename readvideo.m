%��ȡ��Ƶ���õ�Hue��������
tic
global dt
vidObj=VideoReader('10000.avi');                  %����Ƶ�ļ�
dt=1/vidObj.FrameRate;                            %ÿ֡ʱ��
CalArea=[33 223 706 149];                         %������ѡ�񣬰���Ŀ������ͱ궨��
CalX=CalArea(3)+1;CalY=CalArea(4)+1;              %������ߴ�
StartFrame=103;FrameNum=1629;%StartFrameΪ��ʼ֡����Ӧʱ��������������¿�ʼʱ�䣻FrameNum��֤labview���ݺ���Ƶ֡�������
video=struct('RGB0',zeros(vidObj.Height,vidObj.Width,3,'uint8'),...
             'RGB',zeros(CalY,CalX,3,'uint8'),...
             'HSV',zeros(CalY,CalX,3));
Hue=zeros(CalY,CalX,FrameNum);
vidObj.CurrentTime=StartFrame/vidObj.FrameRate;   %����ǰʱ����Ŀ����ʼ֡��Ӧ
for i=1:FrameNum
    video(i).RGB0=readFrame(vidObj);              %����ȫ��RGB
    video(i).RGB=imcrop(video(i).RGB0,CalArea);   %�����������RGB
    video(i).HSV=rgb2hsv(video(i).RGB);           %�Լ�����RGBתHSV����Ҫ�������������ڴ������
    Hue(:,:,i)=video(i).HSV(:,:,1).*255;          %�õ�Hue��������
end                                 
toc
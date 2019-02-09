%读取视频，得到Hue矩阵序列
tic
global dt
vidObj=VideoReader('10000.avi');                  %读视频文件
dt=1/vidObj.FrameRate;                            %每帧时长
CalArea=[33 223 706 149];                         %计算域选择，包含目标区域和标定点
CalX=CalArea(3)+1;CalY=CalArea(4)+1;              %计算域尺寸
StartFrame=103;FrameNum=1629;%StartFrame为起始帧，对应时间必须略早于升温开始时间；FrameNum保证labview数据和视频帧数不溢出
video=struct('RGB0',zeros(vidObj.Height,vidObj.Width,3,'uint8'),...
             'RGB',zeros(CalY,CalX,3,'uint8'),...
             'HSV',zeros(CalY,CalX,3));
Hue=zeros(CalY,CalX,FrameNum);
vidObj.CurrentTime=StartFrame/vidObj.FrameRate;   %将当前时间与目标起始帧对应
for i=1:FrameNum
    video(i).RGB0=readFrame(vidObj);              %读入全体RGB
    video(i).RGB=imcrop(video(i).RGB0,CalArea);   %分离出计算域RGB
    video(i).HSV=rgb2hsv(video(i).RGB);           %对计算域RGB转HSV（主要运算量；容易内存溢出）
    Hue(:,:,i)=video(i).HSV(:,:,1).*255;          %得到Hue矩阵序列
end                                 
toc
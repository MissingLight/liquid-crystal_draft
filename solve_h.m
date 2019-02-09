h_Raw=zeros(CalS,1);
tic
for i=1:CalS
%     h_Raw(i)=NewtonTangent(100,i,6);   %牛顿切线法
    h_Raw(i)=NewtonSecant(100,i,6);   %牛顿割线法
end
Nu_Raw=h_Raw*0.01/0.0273;               %列形式
Nu=reshape(Nu_Raw,CalY,CalX);           %矩阵形式
toc
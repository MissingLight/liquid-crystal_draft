h_Raw=zeros(CalS,1);
tic
for i=1:CalS
%     h_Raw(i)=NewtonTangent(100,i,6);   %ţ�����߷�
    h_Raw(i)=NewtonSecant(100,i,6);   %ţ�ٸ��߷�
end
Nu_Raw=h_Raw*0.01/0.0273;               %����ʽ
Nu=reshape(Nu_Raw,CalY,CalX);           %������ʽ
toc
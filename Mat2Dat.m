%����ֱ������Tecplot��ֱ�Ӷ�ȡ��.dat
Nu_tec=[X,Y,Nu_Raw];
fid=fopen('Nu_tec(5_10000).dat','wt');   %�ļ������ֶ��޸�H/D,Re
fprintf(fid,'TITLE = "Nu_H/D=5_Re=10000"\nVARIABLES = "X""Y""Nu"\nZONE T="ZONE 1 "\n');  %ͼ���⣬�ֶ��޸�H/D,Re
fprintf(fid,['I = ',num2str(CalY),', J = ',num2str(CalX),' , F = POINT\n']);
fprintf(fid,'DT=(DOUBLE DOUBLE DOUBLE)\n');
[m,n]=size(Nu_tec);
 for i=1:1:m
    for j=1:1:n
       if j==n
         fprintf(fid,'%g\n',Nu_tec(i,j));
      else
        fprintf(fid,'%g\t',Nu_tec(i,j));
       end
    end
end
fclose(fid);
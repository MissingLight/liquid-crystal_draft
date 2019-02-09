function h=NewtonSecant(x0,i,m)
x(1)=x0;x(2)=x0+1;
    for j=2:1+m
        x(j+1)=x(j)-fun(x(j),i)*(x(j)-x(j-1))/(fun(x(j),i)-fun(x(j-1),i));
    end
    h=x(find(~isinf(x)&~isnan(x),1,'last'));
end
%Å£¶Ù¸îÏß·¨
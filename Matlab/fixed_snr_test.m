clc
clear
h1=11;
h2=10;
d1=16;
d2=8;
i=1;
for h2=0:10
    [snr_h(i),x,y ]=FixedPoint_simulate(h1,h2,d1,d2);    
    i=i+1;
end
figure(1)
plot(0:10,snr_h);
ylabel('信噪比/dB')
xlabel('脉冲响应对应的2进制小数位数')

i=1;
for d2=0:8
    [snr_d(i),x ,y]=FixedPoint_simulate(h1,h2,d1,d2); 
    i=i+1;
end
figure(2)
plot(0:8,snr_d);
ylabel('信噪比/dB')
xlabel('输出信号对应的2进制小数位数')

figure(3)
[snr,x,y]=FixedPoint_simulate(11,10,16,8);
plot(x,'-o')
hold on
plot(y,'r--')
legend('浮点信号','定点信号');
ylabel('幅度')
xlabel('时间')

figure(4)
[snr,x,y]=FixedPoint_simulate(11,2,16,0);
plot(x,'-o')
hold on
plot(y,'r--')
legend('浮点信号','定点信号');
ylabel('幅度')
xlabel('时间')

 t=1/256:1/256:1;
a=(2^15-1)*sin(2*pi*t);
fid = fopen('data.txt','w');
for i=1:length(a)
   delay_data = fprintf(fid, '%d\n',round(a(i)));
end
fclose(fid);



clc 
clear
%% 无符号
%fid = fopen('delay_signal_file.txt'); 
%f_src= fopen('src_signal_file.txt'); 
%% 有符号
fid = fopen('fir_delay_signal_file.txt'); 
f_src= fopen('int_delay_signal_file.txt'); 

delay_data = fscanf(fid,  '%d', inf);
src_data=fscanf(f_src,  '%d', inf);
figure(1)
plot(src_data./max(src_data))
hold on
plot(delay_data./max(delay_data))


%貌似xcorr只能求整数延迟，现将其横坐标插值10倍，延迟结果在除以10，插值求分数延迟
x=1:4900;
xi=x(1):(x(2)-x(1))/10:x(end);
in=src_data(x);
out=delay_data(x);

delay_data_10=interp1(x,out,xi);
src_data_10=interp1(x,in,xi);
figure(2)
plot(src_data_10/max(src_data));
hold on
plot(delay_data_10/max(delay_data));
%%自相关函数
[delay,zuobiao]=xcorr(src_data_10,delay_data_10,'coeff');
figure(3)
stem(zuobiao,delay)
%延迟
yanchi=zuobiao(find(delay==max(delay)))/10
title(['延迟为',num2str(yanchi),'个采样点'])
xlabel('lags')
ylabel('相关函数值')
%%延迟测试
%{
fs=10e4;
T=1/fs;
L=1000;
t=(0:L-1)*T;
f0=10e3;
x=sin(2*pi*f0*t);
y=x(100:200);
z=x(103:203);
%delay=xcorr(y,y,'coeff');
[delay,zuobiao]=xcorr(y,z,'coeff');
figure(1)
plot(y);
hold on
plot(z);
figure(2)
stem(zuobiao,delay)

zuobiao(find(delay==max(delay)))
%}

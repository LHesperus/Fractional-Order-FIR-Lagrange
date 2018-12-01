clc 
clear
%% �޷���
%fid = fopen('delay_signal_file.txt'); 
%f_src= fopen('src_signal_file.txt'); 
%% �з���
fid = fopen('fir_delay_signal_file.txt'); 
f_src= fopen('int_delay_signal_file.txt'); 

delay_data = fscanf(fid,  '%d', inf);
src_data=fscanf(f_src,  '%d', inf);
figure(1)
plot(src_data./max(src_data))
hold on
plot(delay_data./max(delay_data))


%ò��xcorrֻ���������ӳ٣��ֽ���������ֵ10�����ӳٽ���ڳ���10����ֵ������ӳ�
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
%%����غ���
[delay,zuobiao]=xcorr(src_data_10,delay_data_10,'coeff');
figure(3)
stem(zuobiao,delay)
%�ӳ�
yanchi=zuobiao(find(delay==max(delay)))/10
title(['�ӳ�Ϊ',num2str(yanchi),'��������'])
xlabel('lags')
ylabel('��غ���ֵ')
%%�ӳٲ���
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
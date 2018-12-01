%Lagrange fir
%%%%%%%%%%%%%%%%%%%%%%
Fs = 10e6;                    % Sampling frequency
T = 1/Fs;                     % Sample time
L = 30;                       % Length of signal
t = (0:L-1)*T;                % Time vector
% a 50 Hz sinusoid
f0=1e6;                        %Frequency of signal 
x = sin(2*pi*f0*t) ;           %Signal
%y = x ;%+ 2*randn(size(t));     % Sinusoids plus noise
figure(1)
%plot(Fs*t(1:50),y(1:50))
%title('Signal Corrupted with Zero-Mean Random Noise')
%xlabel('time (milliseconds)')


D=2.5;                               %dealy unit 
N=5;                                 %order of filter 
h=LagrangeH(N,D);                    %time-domain response
figure(1)
stem(h);
y=conv(x,h);                         % output by  convolution 
xlabel('时间坐标')
ylabel('脉冲响应')


figure(2)
%values1=spcrv([[t(1) t t(end)];[x(1) x x(end)]]);
%plot(values1(1,:),values1(2,:),'r')
plot(t,x,'red')
hold on;
stem(t,x,'red')
hold on
%t2=(0:L-1+N)*T;
%values2=spcrv([[t2(1) t2 t2(end)];[y(1) y y(end)]]);
%plot(values2(1,:),values2(2,:),'b')
plot(t,y(1:length(t)));
hold on
stem(t,y(1:length(t)))
xlabel('时间/s')
ylabel('幅度/Vpp')



NFFT = 2^nextpow2(N+1);               %Length of fft
H = fft(h,NFFT);%/(N+1);                %freq-domain response
f = Fs/2*linspace(0,1,NFFT/2+1);      
aaaa=H
% Plot  spectrum.
figure(3)
zz=20*log10(abs(H(1:NFFT/2+1)));
%plot(f/max(f),20*log10(abs(H(1:NFFT/2+1))))
zz(end)=-45;                           %because zz(end)=-inf,diffcult to plot
f1=f/max(f);
values1=spcrv([[f1(1) f1 f1(end)];[zz(1) zz zz(end)]]);
plot(values1(1,:),values1(2,:),'r')
xlabel('归一化频率')
ylabel('归一化幅度/dB')



figure(4)
grpdelay(h,1)


%% 平滑曲线拟合方法
%ff=linspace(min(f),max(f));
%ZZ=spline(f,zz,ff);
%plot(ff,zz)

%values1=spcrv([[x(1) x x(end)];[y(1) y y(end)]]);
%plot(values1(1,:),values1(2,:),'r')

%%

C=linspecer(9);
aa=1;
for D=2.1:0.1:2.9
N=5;                                 %order of filter 
h=LagrangeH(N,D);                    %time-domain response
%group delay
figure(5)
grpd=grpdelay(h,1) ;
grpd_x=(1:length(grpd))/length(grpd);
plot(grpd_x,grpd,'color',C(aa,:))
hold on
xlabel('归一化频率(x \pi rad/sample)')
ylabel('群时延(samples)')
aa=aa+1;
end
legend('D=2.1','D=2.2','D=2.3','D=2.4','D=2.5','D=2.6','D=2.7','D=2.8','D=2.9')
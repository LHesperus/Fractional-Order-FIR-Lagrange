%fixed point simulate
function [fix_snr,float_delay,delay_signal]=FixedPoint_simulate(h1,h2,d1,d2)
Fs = 10e6;                    % Sampling frequency
T = 1/Fs;                     % Sample time
L = 30;                       % Length of signal
t = (0:L-1)*T;                % Time vector
% a 50 Hz sinusoid
f0=1e6;                        %Frequency of signal 
A=2^5;
x = A*sin(2*pi*f0*t)+A*sin(2*pi*0.7*f0*t)+A*sin(2*pi*1.3*f0*t);          %Signal


src_signal=fi(x,1,16,8);
delay_signal_long=zeros(1,length(src_signal));
h=[ 0.0117   -0.0977    0.5859    0.5859   -0.0977    0.0117];
%h=[0.0089   -0.0706    0.3431    0.8006   -0.0924    0.0104];%N=5,D=2.7
h_f=fi(h,1,h1,h2);                                          

for i=1:length(src_signal)
    if i>=length(h_f)
        delay_signal_long(i)=sum(src_signal(i-length(h_f)+1:i).*h_f(end:-1:1));
    else
        delay_signal_long(i)=sum(src_signal(1:i).*h_f(i:-1:1));
    end
end

float_delay=conv(x,h); 
delay_signal=fi(delay_signal_long,1,d1,d2);

fix_snr=10*log10(mean(float_delay(1:length(delay_signal.Data)).^2)/mean((float_delay(1:length(delay_signal))-delay_signal.Data).^2));
end
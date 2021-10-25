clear all; clc; close all;

fs=96000;

figure('Name','Espectro de frecuencias','NumberTitle','off','units','normalized','outerposition',[0 0 1 1])

t=0.01;

while 1
    r=audiorecorder(fs,16,1);
    recordblocking(r, t);
    
    %record(r);
    %pause(0.00001)
    %stop(r);
    
    y=getaudiodata(r,'int16');
    %y=r.getaudiodata();
    
    subplot(2,1,1);
    plot(y)
    title('Frec. de Audio En Tiempo Real');
    xlim([90 500]);
    ylim([-100000 100000]);
    
    L=length(y);
    nfft=2^nextpow2(L);
    Y=fft(y,nfft)/L;
    f=fs/2*linspace(0,1,nfft/2+1);
    
    subplot(2,1,2);
    stem(f,2*abs(Y(1:nfft/2+1)),'g');
    title('Espectro De Frecuencias');
    %xlim([0 10000]);
    xlabel('Frecuencia [Hz]');
    ylim([0 20000]);
    ylabel('|FFT(x[n])|');
    
    grid on
end

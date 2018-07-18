function [J FreqsFft] = espectro(Mix,NumAmostrasTotal,FreqAmostWav)
%%Defini��o da quantidade de amostras da fft
NumAmostrasFft=2^nextpow2(NumAmostrasTotal);

%%f relaciona a frequ�ncia com a posi��o dos termos da fft
FreqsFft=FreqAmostWav/2*linspace(0,1,NumAmostrasFft/2+1);

%FFT e espectro
I=fft(Mix,2^nextpow2(NumAmostrasTotal));
J=abs(I(1:2^nextpow2(NumAmostrasTotal)/2));
end

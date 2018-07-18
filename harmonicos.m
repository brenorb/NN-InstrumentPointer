% harmonicos.m
%
% [amplitudes indfreq] = harmonicos(J,NumParciais);
%
% Este c�digo usa o espectro j� estra�do de uma FFT
% e o encontra o n�mero de harm�nicos igualmente espa�ados
% e guarda sua amplitude e respectiva frequ�ncia.
% OBS: lembre-se que o espectro � o m�dulo da metade 
% das amostras do vetor obtido na FFT
%
%Esse c�digo abaixo � para poder conferir se pegou direito os harmonicos
%o pontilhado � o espectro original
%com isso d� pra ver o que foi apagado para se pegar
%os hamonicos no ponto m�ximo do gr�fico.
% plot(J,':')
% hold on
% plot(Jtemp)
% hold on
% plot(indfreq,amplitudes,'d')
% hold off
% 
% 
% Breno Rodrigues Brito
% 30\01\2011
%

function [amplitudes indfreq] = harmonicos(J,NumParciais)
% Extra��o dos harm�nicos

limpeza=14e-2; %porcentagem de limpeza ao lado dos harm�nicos

Jtemp=J;
%para tirar o efeito do canto, ou seja, componente DC
Jtemp(1:50)=0;
amp_freq=zeros(2,4);
for k=1:4
    [amp_freq(1,k),amp_freq(2,k)]=max(Jtemp);
    for n=round((1-limpeza)*amp_freq(2,k)):round((1+limpeza)*amp_freq(2,k))
    Jtemp(n)=0;
    end    
end
%testar erros
[indfreq]=sort(amp_freq(2,:));
distancias=diff(indfreq);
dist_de_amostras=median(distancias);
limpeza_abs=round(.95*dist_de_amostras); %com uma margem de erro
%rodar a extra��o de novo mas com um �ndice absoluto de limpeza
Jtemp=J;
%para tirar o efeito do canto
    Jtemp(1:30)=0;
amp_freq=zeros(2,NumParciais);
for k=1:NumParciais
    [amp_freq(1,k),amp_freq(2,k)]=max(Jtemp);
    menos = round(amp_freq(2,k)-limpeza_abs);
    for n=menos:round(amp_freq(2,k)+limpeza_abs)
    Jtemp(n)=0;
    end 
    %Esse c�digo comentado � para debug
%     plot(J,':')
% hold on
% plot(Jtemp)
% hold on
% plot(amp_freq(2,:),amp_freq(1,:),'d')
% hold off
end

%colocar em ordem de frequ�ncia
[indfreq,ind]=sort(amp_freq(2,:));
amplitudes=zeros(size(indfreq));
for n = 1:NumParciais
    amplitudes(n)=amp_freq(1,ind(n));
end


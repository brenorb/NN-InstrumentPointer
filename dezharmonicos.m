% dezharmonicos.m
%
% amplitudes = dezharmonicos(som, nHarm)
%
% Extrai harmonicos do vetor som, sendo 1 do 
% som sem processamento, 1 com o som processado
% e 10 com ruidos
%
% amplitudes - Matriz com nHarm x 12 componentes
% som - Vetor contendo o som
% nHarm - número de harmonicos que se deseja extrair
%
% Breno Rodrigues Brito
% 30\01\2011
%
%%
function [amplitudes FreqsFft, indfreq] = dezharmonicos(som, nHarm,FreqAmostWav)

% Parâmetros Iniciais
TamanhoMif=1024;
NumParciais=nHarm;
fator=128;
Janela=2048;
NumAmostrasTotal=14320;
NumAmostrasPasso=16;

%Processamento Inicial do vetor de som
[Mix MixInicial] = processom(som, NumAmostrasTotal, Janela); 
%Normalização
Mix = Mix/(Mix'*Mix);
MixInicial=MixInicial/(MixInicial'*MixInicial);

%Extração dos harmonicos do som processado
amplitudes=zeros(NumParciais,2+TamanhoMif/fator);
[J FreqsFft] = espectro(Mix,NumAmostrasTotal,FreqAmostWav);
[amplitudes(:,1) indfreq]=harmonicos(J,NumParciais);
%Extração de harmônicos do som raw
[J FreqsFft] = espectro(MixInicial,NumAmostrasTotal,FreqAmostWav);
[amplitudes(:,2)]=harmonicos(J,NumParciais);
%Extração de Harmônicos com ruído
for n=5:5:50;
[J FreqsFft] = espectro(MixInicial+(0.5-rand(length(MixInicial),1))*...
    max(MixInicial)*n/100,NumAmostrasTotal,FreqAmostWav);
[amplitudes(:,2+n/5)]=harmonicos(J,NumParciais);
end
%%
% %agora se extrai vários harmônicos no tempo
% i=0;
% for n=1:fator:TamanhoMif
%     i=1+i;
%     y=MixInicial((n-1)*NumAmostrasPasso+1:(n-1)*NumAmostrasPasso+Janela);
%     [J FreqsFft] = espectro(y,Janela,FreqAmostWav);
%     [amplitudes(:,2+i)]=harmonicos(J,NumParciais);
% end
% figure(9)
% plot(amplitudes)

% FreqsFft(indfreq(1,1:length(indfreq)-1))
%%
%pronto. A matriz Amplitudes tem em suas colunas vários vetores de
%treinamento.
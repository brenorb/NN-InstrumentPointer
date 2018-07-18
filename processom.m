% processom.m
% 
% [Mix MixInicial] = processom(Som)
% 
% Esta fun��o converte o arquivo de stereo para mono, caso necess�rio.
% Al�m disso, acrescenta silencio ao in�cio e ao fim do
% vetor Som e adiciona um efeito de fade out.
% 
% Mix - Vetor de som ap�s a mixagem
% MixInicial - C�pia do Vetor Som sem as altera��es
% Som - Vetor de entrada
%
%Breno Rodrigues Brito
% 30\01\2011
%

function [Mix MixInicial] = processom(Som,NumAmostrasTotal,Janela)
%Convers�o Stero - Mono
Canais=size(Som);
if Canais(2)==2
    MixInicial=zeros(length(Som),1);
    for n=1:length(Som)
        MixInicial(n)=(Som(n,1)+Som(n,2))/2;
    end
else
    MixInicial=Som;
end

%%Defini��o do som somente com as amostras a serem utilizadas
MixIntermed=MixInicial(1:NumAmostrasTotal);

%%Fade-out
NumAmostrasFadeOut=round(length(MixIntermed)/5);
IndLog=linspace(0.1,1,NumAmostrasFadeOut);
FatMultFadeOut=zeros(1,NumAmostrasFadeOut);
for n=1:NumAmostrasFadeOut
    FatMultFadeOut(n)=-log10(IndLog(n));
end

for n=length(MixIntermed)-NumAmostrasFadeOut+1:length(MixIntermed)
    MixIntermed(n)=MixIntermed(n)*FatMultFadeOut(n-(length(MixIntermed)-NumAmostrasFadeOut));
end

%%Adi��o de sil�ncio no come�o e fim do arquivo
Mix=zeros(length(MixIntermed)+2*Janela,1);
for n=1:Janela
    Mix(n)=0;
end
for n=Janela+1:Janela+length(MixIntermed)
    Mix(n)=MixIntermed(n-Janela);
end
for n=Janela+1+length(MixIntermed):length(Mix);
    Mix(n)=0;
end
end
%%
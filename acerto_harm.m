% acerto_harm.m
% 
% [acerto]=acerto_harm(Instruments, nHarm);
% 
% Esta função recebe a cell Instruments, gera outros Patterns
% com outros ruídos calcula o acerto em encontrar os instrumentos
% 
% Breno Rodrigues Brito
% 
% 30/01/2011

function [acerto]=acerto_harm(Rede,Instruments, nHarm)

[Pattern Target] = GPatTar(Instruments, nHarm);
Result=zeros(size(Target));

for n=1:length(Pattern);
    [Result(:,n)]=sim(Rede,Pattern(:,n));
end
%for r=1:25
    Resultbin=Result;
    correlacao=0.5; %+r/100;
for n=1:length(Pattern);
    for k=1:min(size(Resultbin))
        if Resultbin(k,n)>=correlacao
            Resultbin(k,n)=1;
        else
            Resultbin(k,n)=0;
        end
    end
end

MtrxErro=(Resultbin==Target); %compara se o resultado é o desejado
acerto=zeros(min(size(MtrxErro)),1);
for k=1:length(acerto)
    acerto(k)=sum(MtrxErro(k,:))/length(MtrxErro);
end
acerto(:)=acerto(:)*100; %em porcentagem

%end
% mediacerto=zeros(min(size(Target)));
% for k=1:length(mediacerto)
% mediacerto(k)=sum(acerto(k,:))/length(acerto);
% end
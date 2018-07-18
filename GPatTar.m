% genTrainMatrix.m
% 
% [Pattern Target] = GPatTar(Instruments)
%
% 
%
%
% Dyego Soares de Ara�jo
% 30\01\2011
%
%%
function [Pattern Target] = GPatTar(Instruments, nHarm)
% Numero de instrumentos
nInst = length(Instruments);

%Inicializa��o das matrizes Pattern - Target
Pattern = zeros(nHarm, 20);
Target = zeros(nInst, 20);

%Varredura sobre os instrumentos
for n = 1:nInst
    %Varredura sobre as amostras
    nNote = length(Instruments{n}.som);
    for k = 1:nNote
        try
        % Gera os padr�es Pattern
        subPattern = dezharmonicos(Instruments{n}.som{k,1},nHarm,Instruments{n}.som{k,2});
        % Acrescenta a matriz Pattern
        Pattern = [Pattern subPattern];
        % Gera os padr�es Target Correspondentes
        subTarget = zeros(nInst, 12);
        subTarget(n, :) = 1;
        % Acrescenta a matriz Target
        Target = [Target subTarget];
        catch ME
        end
    end
end

end
%%
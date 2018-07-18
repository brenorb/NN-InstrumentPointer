% WavImport.m
%
% Instruments = WavImport();
%
% Este código tem por objetivo importar os arquivos wav
% contendo as notas de cada instrumento e armazena-los numa estrutura
% cell array.
%
% Dyego Soares de Araújo
% 30\01\2011
%
%%
function Instruments = WavImport()
%Número de Instrumentos
Ninst = input('Entre com o número de Instrumentos desejado:\n');
Instruments{Ninst} = 0;
%Importação do Instrumento
for n=1:Ninst
    In.name = input('Entre com o nome do Instrumento:\n', 's');
    nAmo = input('Quantas arquivos de som do instrumento?\n:');
    for m = 1:nAmo
        [In.som{m,1} In.som{m,2}] = wavread([In.name int2str(m)]);
    end
    Instruments{n} = In;
end
end
%%
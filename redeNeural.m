% redeNeural.m
%
% Rede = redeNeural(P, T, nNeu)
%
% Gera a rede neural que se adequa aos padr�es
% de treinamento P e T, e com n�mero de neuronios
% na camada escondida nNeu
%
% Rede - Rede neural Treinada
% P - Matriz Pattern
% T - Matriz Target
% nNeu - N�mero de neuronios na camada intermediaria
%
% Dyego Soares de Ara�jo
% 30\01\2011
%
%%
function Rede = redeNeural(P, T, nNeu)
%Cria a rede neural
Rede = newff(P, T, nNeu, {'tansig', 'purelin'}, 'trainscg');
%Parametros de Divisao
Rede.divideParam.trainRatio = 1;
Rede.divideParam.testRatio = 0;
Rede.divideParam.valRatio = 0;
%Parametros de Treinamento
Rede.trainParam.epochs = 2000;
%Inicializa��o aleat�ria de Parametros
Rede.IW{1, 1} = rand(nNeu,size(P,1))*.3;
Rede.LW{2, 1} = rand(size(T,1),nNeu)*.3;
Rede.b{1, 1} = rand(nNeu, 1)*.3;
Rede.b{2, 1} = rand(size(T,1), 1)*.3;

%Treinamento da rede
Rede = train(Rede,P,T);

end
%%
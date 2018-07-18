% Instruments = WavImport();
load('Instruments');
nHarm=9;
nNeu=100;
[Pattern Target] = GPatTar(Instruments, nHarm);
Rede = redeNeural(Pattern, Target, nNeu);
[acerto]=acerto_harm(Rede,Instruments, nHarm);

% fprintf('A porcentagem de acerto foi:\nPara %s foi %f\nPara %s foi %f\nPara %s foi %f\nPara %s foi %f\nPara %s foi %f\n',In.name,acerto)

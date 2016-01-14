%% Experiment with the cnn_mnist_fc_bnorm

[net_bn, info_bn] = cnn_mnist(...
  'expDir', 'data/', 'useBatchNorm', false);

% [net_fc, info_fc] = cnn_mnist(...
%   'expDir', 'data/mnist-baseline', 'useBatchNorm', false);

figure(1) ; clf ;
subplot(1,2,1) ;
% semilogy(info_fc.val.objective', 'o-') ; hold all ;
semilogy(info_bn.val.objective', '+--') ; hold all ;
xlabel('Training samples [x 10^3]'); ylabel('energy') ;
grid on ;
h=legend('BNORM') ;
% set(h,'color','none');
title('objective') ;
subplot(1,2,2) ;
% plot(info_fc.val.error', 'o-') ; hold all ;
plot(info_bn.val.error', '+--') ; hold all ;
h=legend('BNORM-val','BNORM-val-5') ;
grid on ;
xlabel('Training samples [x 10^3]'); ylabel('error') ;
% set(h,'color','none') ;
title('error') ;
drawnow ;
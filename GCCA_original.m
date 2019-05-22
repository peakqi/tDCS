function GCCA_original

%load('VOI_PPCL_1.mat')
% A=Y
% load('VOI_Cng_1.mat')
% A=cat(2,A,Y)
% load('VOI_Mc_1.mat')
% A=cat(2,A,Y)
% load('VOI_V1_1.mat')
% A=cat(2,A,Y)
% load('VOI_dCrb_1.mat')
% A=cat(2,A,Y)
% load('VOI_Pre_1.mat')
% A=cat(2,A,Y)
% load('VOI_uCrb_1.mat')
% A=cat(2,A,Y)
% load('VOI_ppc_1.mat')
% A=cat(2,A,Y)
% save A.mat A
clear
clc
load M1_4pR.txt;
load M1_4pL.txt;
load PremotorR.txt;
load PremotorL.txt;
load SMA_L.txt;
A=M1_4pR-mean(M1_4pR);
A=cat(2,A,M1_4pL-mean(M1_4pL));
A=cat(2,A,PremotorR-mean(PremotorR));
A=cat(2,A,PremotorL-mean(PremotorL));
A=cat(2,A,SMA_L-mean(SMA_L));
% for kk=1:4
%     A(:,kk)=A(:,kk)/std(A(:,kk))
% end


ntrials   =1;      % number of trials
nobs      = 89;     % number of observations per trial

regmode   = 'OLS';  % VAR model estimation regression mode ('OLS', 'LWR' or empty for default)
icregmode = 'LWR';  % information criteria regression mode ('OLS', 'LWR' or empty for default)

morder    = 'AIC';  % model order to use ('actual', 'AIC', 'BIC' or supplied numerical value)
momax     = 20;     % maximum model order for model order estimation

tstat     = '';     % statistical test for MVGC:  'chi2' for Geweke's chi2 test (default) or'F' for Granger's F-test
alpha     = 0.05; 
 ;% significance level for significance test
mhtc      = 'FDR';  % multiple hypothesis test correction (see routine 'significance')

X=A';

AT = eye(4);
nvars = size(AT,1); % number of variables
SIGT = eye(nvars);






[AIC,BIC] = tsdata_to_infocrit(X,momax,icregmode);

[~,bmo_AIC] = min(AIC);
[~,bmo_BIC] = min(BIC);

% Plot information criteria.

figure(1); clf;
plot((1:momax)',[AIC BIC]);
legend('AIC','BIC');

amo = size(AT,3); % actual model order

fprintf('\nbest model order (AIC) = %d\n',bmo_AIC);
fprintf('best model order (BIC) = %d\n',bmo_BIC);
fprintf('actual model order     = %d\n',amo);
amo=aa
% Select model order

if     strcmpi(morder,'actual')
    morder = amo;
    fprintf('\nusing actual model order = %d\n',morder);
elseif strcmpi(morder,'AIC')
    morder = bmo_AIC;
    fprintf('\nusing AIC best model order = %d\n',morder);
elseif strcmpi(morder,'BIC')
    morder = bmo_BIC;
    fprintf('\nusing BIC best model order = %d\n',morder);
else
    fprintf('\nusing specified model order = %d\n',morder);
end
morder=aa;
%% Granger causality estimation

% Calculate time-domain pairwise-conditional causalities. Return VAR parameters
% so we can check VAR.

ptic('\n*** GCCA_tsdata_to_pwcgc... ');
[F,A,SIG] = GCCA_tsdata_to_pwcgc(X,morder,regmode); % use same model order for reduced as for full regressions
ptoc;

% Check for failed (full) regression

assert(~isbad(A),'VAR estimation failed');

% Check for failed GC calculation

assert(~isbad(F,false),'GC calculation failed');

% Check VAR parameters (but don't bail out on error - GCCA mode is quite forgiving!)

rho = var_specrad(A);
fprintf('\nspectral radius = %f\n',rho);
if rho >= 1,       fprintf(2,'WARNING: unstable VAR (unit root)\n'); end
if ~isposdef(SIG), fprintf(2,'WARNING: residuals covariance matrix not positive-definite\n'); end

% Significance test using theoretical null distribution, adjusting for multiple
% hypotheses.

pval = mvgc_pval(F,morder,nobs,ntrials,1,1,nvars-2,tstat);
sig  = significance(pval,alpha,mhtc);

% Plot time-domain causal graph, p-values and significance.

figure(2); clf;
subplot(1,3,1);
plot_pw(F);
title('Pairwise-conditional GC');
subplot(1,3,2);
plot_pw(pval);
title('p-values');
subplot(1,3,3);
plot_pw(sig);
title(['Significant at p = ' num2str(alpha)])

fprintf(2,'\nNOTE: no frequency-domain pairwise-conditional causality calculation in GCCA compatibility mode!\n');

legend('M1R','M1L','PreR','PreL','SMAL')
%%
% <mvgc_demo_GCCA.html back to top>


clear all;
close all;
clc;

% load audio and separate channels
[y1,Fs] = audioread('trial 3.wav');
dt = 1/Fs;
t1 = 0:dt:(length(y1)*dt)-dt;
yL = y1(:,1);
yR = y1(:,2);

% perform cross corr and find time diff
[acor, lag] = xcorr(yR,yL);
[~,I] = max(abs(acor));
lagdiff = lag(I);
timediff = lagdiff/Fs;
plot(lag/Fs,acor)
set(gca,'fontsize',20)
title('Trial 3: Cross Correlation','fontsize', 20)
axis([-.001 .001 70 100])

xlabel('Time Difference (sec)', 'FontSize', 20)
ylabel('Magnitude of Cross Correlation', 'FontSize', 20)
grid ON
% on graph when shift is left of zero => right channel recieves earlier
%%
% align both channels so that they can be plotted and observe shift
yLal = yL(-lagdiff+1:end);
t1al = (0:length(yLal)-1)/Fs;

figure(2)

subplot(2,1,1)
plot(t1al,yLal)
set(gca,'fontsize',20)
title('Left Ear','fontsize', 20)
xlabel('Time (s)','fontsize', 20)
ylabel('Amplitude','fontsize', 20)

subplot(2,1,2)
plot(t1,yR)
set(gca,'fontsize',20)
title('Right Ear','fontsize', 20)
xlabel('Time (s)','fontsize', 20)
ylabel('Amplitude','fontsize', 20)

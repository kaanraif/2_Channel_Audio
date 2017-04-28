%--------------------------------------------------------------------------
% Created by Kaan Raif on 3/9/2017 
% 
% Revision History: None
% 
% 
% Purpose: Separate and process binaural recordings by location
%--------------------------------------------------------------------------

clear all;
close all;
clc;

[y,Fs] = audioread('Right_3.wav');
dt = 1/Fs;
t = 0:dt:(length(y)*dt)-dt;
yL = y(:,1);
yR = y(:,2);

% Plot binuaral of right speaker only
figure(1)
subplot(2,1,1);
plot(t,yL);
title('Binuaral Audio from Right Speaker: Left Channel');
xlabel('Seconds');
ylabel('Amplitude');
subplot(2,1,2);
plot(t,yR)
title('Binuaral Audio from Right Speaker: Right Channel');
xlabel('Seconds');
ylabel('Amplitude');

% Plot audio of left speaker only
[y,Fs] = audioread('Left_3.wav');
dt = 1/Fs;
t = 0:dt:(length(y)*dt)-dt;
yL = y(:,1);
yR = y(:,2); 
figure(2)
subplot(2,1,1);
plot(t,yL);
title('Binuaral Audio from Left Speaker: Left Channel');
xlabel('Seconds');
ylabel('Amplitude');
subplot(2,1,2)
plot(t,yR)
title('Binuaral Audio from Left Speaker: Right Channel');
xlabel('Seconds');
ylabel('Amplitude');


% Plot audio of left&right speaker: TRIAL 1
[y,Fs] = audioread('trial 1.wav');
dt = 1/Fs;
t = 0:dt:(length(y)*dt)-dt;
yL = y(:,1);
yR = y(:,2); 
figure(3)
subplot(2,1,1)
plot(t,yL);
xlabel('Seconds');
ylabel('Amplitude');
title('TRIAL 1: Left Channel');
subplot(2,1,2)
plot(t,yR)
xlabel('Seconds');
ylabel('Amplitude');
title('TRIAL 1: Right Channel');

% Plot audio of left&right speaker: TRIAL 2
[y,Fs] = audioread('trial 2.wav');
dt = 1/Fs;
t = 0:dt:(length(y)*dt)-dt;
yL = y(:,1);
yR = y(:,2); 
figure(4)
subplot(2,1,1)
plot(t,yL);
xlabel('Seconds');
ylabel('Amplitude');
title('TRIAL 2: Left Channel');
subplot(2,1,2)
plot(t,yR)
xlabel('Seconds');
ylabel('Amplitude');
title('TRIAL 2: Right Channel');

% Plot audio of left&right speaker: TRIAL 3
[y,Fs] = audioread('trial 3.wav');
dt = 1/Fs;
t = 0:dt:(length(y)*dt)-dt;
yL = y(:,1);
yR = y(:,2); 
figure(5)
subplot(2,1,1)
plot(t,yL);
xlabel('Seconds');
ylabel('Amplitude');
title('TRIAL 3: Left Channel');
subplot(2,1,2)
plot(t,yR)
title('TRIAL 3: Right Channel');
xlabel('Seconds');
ylabel('Amplitude');

% Plot audio of left&right speaker: TRIAL 3
[y,Fs] = audioread('trial 4.wav');
dt = 1/Fs;
t = 0:dt:(length(y)*dt)-dt;
yL = y(:,1);
yR = y(:,2); 
figure(6)
subplot(2,1,1)
plot(t,yL);
xlabel('Seconds');
ylabel('Amplitude');
title('TRIAL: Left Channel');
subplot(2,1,2)
plot(t,yR)
title('TRIAL: Right Channel');
xlabel('Seconds');
ylabel('Amplitude');

% Plot audio of left&right speaker: TRIAL 3
[y,Fs] = audioread('trial 5.wav');
dt = 1/Fs;
t = 0:dt:(length(y)*dt)-dt;
yL = y(:,1);
yR = y(:,2); 
figure(7)
subplot(2,1,1)
plot(t,yL);
xlabel('Seconds');
ylabel('Amplitude');
title('TRIAL 5: Left Channel');
subplot(2,1,2)
plot(t,yR)
title('TRIAL 5: Right Channel');
xlabel('Seconds');
ylabel('Amplitude');



% Create Summed Wave of Left and Right speakers alone and overlay on the
% waveform of when both were presented

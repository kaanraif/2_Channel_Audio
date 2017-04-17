%--------------------------------------------------------------------------
% Created by Kaan Raif on 2/6/2017 
% 
% Revision History: 
%
% 2/18/2017 Complete revison of sound generation (created separate audio
%   generation for each speaker)
% 
% Purpose: Generates a GUI that allows you to select a channel to play
% audio from a two channel sound array
%--------------------------------------------------------------------------

function varargout = Left_Right(varargin)
% LEFT_RIGHT MATLAB code for Left_Right.fig
%      LEFT_RIGHT, by itself, creates a new LEFT_RIGHT or raises the existing
%      singleton*.
%
%      H = LEFT_RIGHT returns the handle to a new LEFT_RIGHT or the handle to
%      the existing singleton*.
%
%      LEFT_RIGHT('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in LEFT_RIGHT.M with the given input arguments.
%
%      LEFT_RIGHT('Property','Value',...) creates a new LEFT_RIGHT or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Left_Right_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Left_Right_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Left_Right

% Last Modified by GUIDE v2.5 07-Feb-2017 20:36:51

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Left_Right_OpeningFcn, ...
                   'gui_OutputFcn',  @Left_Right_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before Left_Right is made visible.
function Left_Right_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Left_Right (see VARARGIN)

% Choose default command line output for Left_Right
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Left_Right wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Left_Right_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes Left Channel Sound.
function pushbutton1_Callback(hObject, eventdata, handles)
clear all;


% load in sound (speach)
[a, Fs] = audioread('Sound_1.m4a');

% Stereo to Mono
 x = (a(:,1) + a(:,2))/2;

% create 2 channel sound matrix with right channel clear
sound( [x,zeros(length(x),1)], Fs);


clc;

% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes Right Channel Sound.
function pushbutton2_Callback(hObject, eventdata, handles) 
clear all;

% Read in audio (music)
[b, Fs] = audioread('Sound_2.m4a');

% Stereo to Mono
y = (b(:,1)+b(:,2))/2;

% create 2 channel sound matrix with left channel clear
sound([zeros(length(y),1), y], Fs);


clc;


% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes closing the GUI.
function pushbutton4_Callback(hObject, eventdata, handles)
close all;
clear all;
clc;

%hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on mouse press over figure background.
function figure1_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes Both Speakers.
function pushbutton5_Callback(hObject, eventdata, handles)
clear all;


% read in both sounds
[a, Fs] = audioread('Sound_1.m4a');
[b, Fs] = audioread('Sound_2.m4a');



% Convert stereo to mono
x = (a(:,1)+a(:,2))/2;
y = (b(:,1)+b(:,2))/2;

for k = length(y):length(x)-1
    y(k+1,1) = 0;
end


% create 2 channel sound matrix
sound([x,y], Fs);

clc;

% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

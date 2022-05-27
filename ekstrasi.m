function varargout = ekstrasi(varargin)
% EKSTRASI MATLAB code for ekstrasi.fig
%      EKSTRASI, by itself, creates a new EKSTRASI or raises the existing
%      singleton*.
%
%      H = EKSTRASI returns the handle to a new EKSTRASI or the handle to
%      the existing singleton*.
%
%      EKSTRASI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in EKSTRASI.M with the given input arguments.
%
%      EKSTRASI('Property','Value',...) creates a new EKSTRASI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before ekstrasi_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to ekstrasi_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help ekstrasi

% Last Modified by GUIDE v2.5 22-May-2022 14:10:06

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @ekstrasi_OpeningFcn, ...
                   'gui_OutputFcn',  @ekstrasi_OutputFcn, ...
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


% --- Executes just before ekstrasi is made visible.
function ekstrasi_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to ekstrasi (see VARARGIN)

% Choose default command line output for ekstrasi
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes ekstrasi wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = ekstrasi_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in btn_input.
function btn_input_Callback(hObject, eventdata, handles)
% hObject    handle to btn_input (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
open=guidata(gcbo);

[A]=uigetfile({'*.jpg;*.png;*.jpeg'},'openimage');
image=imread(A);

set(open.figure1,'CurrentAxes',open.axes1);
set(imagesc(image));
set(open.axes1,'Userdata',image);


% --- Executes on button press in btn_ekstrasi.
function btn_ekstrasi_Callback(hObject, eventdata, handles)
% hObject    handle to btn_ekstrasi (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

open = guidata(gcbo);
data=get(open.axes1,'Userdata');

red=data(:,:,1);
green=data(:,:,2);
blue=data(:,:,3);

rata2red=mean(mean(red));
rata2green=mean(mean(green));
rata2blue=mean(mean(blue));

normalred=rata2red/255;
normalgreen=rata2green/255;
normalblue=rata2blue/255;

set(handles.txt_red,'String',normalred);
set(handles.txt_green,'String',normalgreen);
set(handles.txt_blue,'String',normalblue);

function txt_red_Callback(hObject, eventdata, handles)
% hObject    handle to txt_red (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txt_red as text
%        str2double(get(hObject,'String')) returns contents of txt_red as a double


% --- Executes during object creation, after setting all properties.
function txt_red_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txt_red (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function txt_green_Callback(hObject, eventdata, handles)
% hObject    handle to txt_green (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txt_green as text
%        str2double(get(hObject,'String')) returns contents of txt_green as a double


% --- Executes during object creation, after setting all properties.
function txt_green_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txt_green (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function txt_blue_Callback(hObject, eventdata, handles)
% hObject    handle to txt_blue (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txt_blue as text
%        str2double(get(hObject,'String')) returns contents of txt_blue as a double


% --- Executes during object creation, after setting all properties.
function txt_blue_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txt_blue (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

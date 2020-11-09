function varargout = algebra(varargin)
% ALGEBRA MATLAB code for algebra.fig
%      ALGEBRA, by itself, creates a new ALGEBRA or raises the existing
%      singleton*.
%
%      H = ALGEBRA returns the handle to a new ALGEBRA or the handle to
%      the existing singleton*.
%
%      ALGEBRA('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in ALGEBRA.M with the given input arguments.
%
%      ALGEBRA('Property','Value',...) creates a new ALGEBRA or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before algebra_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to algebra_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help algebra

% Last Modified by GUIDE v2.5 08-Aug-2016 23:48:01

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @algebra_OpeningFcn, ...
                   'gui_OutputFcn',  @algebra_OutputFcn, ...
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


% --- Executes just before algebra is made visible.
function algebra_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to algebra (see VARARGIN)

% Choose default command line output for algebra
handles.output = hObject;
axes (handles.axes1)
imshow('fondo.jpeg')
axes (handles.axes4)
imshow('Logo2.jpg')
axes (handles.axes2)
imshow('Software.jpg')
% Update handles structure
guidata(hObject, handles);

% UIWAIT makes algebra wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = algebra_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on slider movement.
function slider1_Callback(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slider1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on mouse press over axes background.
function axes1_ButtonDownFcn(hObject, eventdata, handles)
[nombre dire]=uigetfile ('*.pnp','A')
imagen=imread (fullfile(dire , nombre));
axes (handles.axes1)


% --- Executes on button press in gaussiana.
function gaussiana_Callback(hObject, eventdata, handles)
% hObject    handle to gaussiana (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in jordan.
function jordan_Callback(hObject, eventdata, handles)
global resp fila colum
Datos=str2double(get(handles.nfnc,'data'));
fila=str2double(get(handles.fila,'String'));
colum=str2double(get(handles.columna,'String'));
resp=rref(Datos);
resul=resp(:,colum);
x=resp(fila,colum);
y=resp(fila,colum-1);
set(handles.resultado,'string',num2str(resp));
if x>y
    set(handles.mensaje,'string','El sistema tiene indeterminadas soluciones');
else
    if y==0 && x~=0
        set(handles.mensaje,'string','El sistema es inconsistente, no tiene soluciones');
    else
        if x==0
            set(handles.mensaje,'string','El sistema tiene infinitas soluciones');
        else
            set(handles.resul,'string',num2str(resul));
        end
    end
end  

% hObject    handle to jordan (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in cramer.
function cramer_Callback(hObject, eventdata, handles)
% hObject    handle to cramer (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in salir.
function salir_Callback(hObject, eventdata, handles)
close
% hObject    handle to salir (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function fila_Callback(hObject, eventdata, handles)
% hObject    handle to fila (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of fila as text
%        str2double(get(hObject,'String')) returns contents of fila as a double


% --- Executes during object creation, after setting all properties.
function fila_CreateFcn(hObject, eventdata, handles)
% hObject    handle to fila (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function columna_Callback(hObject, eventdata, handles)
% hObject    handle to columna (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of columna as text
%        str2double(get(hObject,'String')) returns contents of columna as a double


% --- Executes during object creation, after setting all properties.
function columna_CreateFcn(hObject, eventdata, handles)
% hObject    handle to columna (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in inmatriz.
function inmatriz_Callback(hObject, eventdata, handles)
fil=str2double(get(handles.fila,'String'));
col=str2double(get(handles.columna,'String'));
tam=cell(fil,col);
tam(:,:)={''};
set(handles.mensaje,'string','    ');
set(handles.resultado,'string','    ');
set(handles.resul,'string','    ');
set(handles.nfnc,'Data',tam);
set(handles.nfnc,'ColumnEditable',true(1,col));


% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over resultado.
function resultado_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to resultado (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes when entered data in editable cell(s) in nfnc.
function nfnc_CellEditCallback(hObject, eventdata, handles)
% hObject    handle to nfnc (see GCBO)
% eventdata  structure with the following fields (see MATLAB.UI.CONTROL.TABLE)
%	Indices: row and column indices of the cell(s) edited
%	PreviousData: previous data for the cell(s) edited
%	EditData: string(s) entered by the user
%	NewData: EditData or its converted form set on the Data property. Empty if Data was not changed
%	Error: error string when failed to convert EditData to appropriate value for Data
% handles    structure with handles and user data (see GUIDATA)

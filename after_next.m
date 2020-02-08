function varargout = after_next(varargin)
% AFTER_NEXT MATLAB code for after_next.fig
%      AFTER_NEXT, by itself, creates a new AFTER_NEXT or raises the existing
%      singleton*.
%
%      H = AFTER_NEXT returns the handle to a new AFTER_NEXT or the handle to
%      the existing singleton*.
%
%      AFTER_NEXT('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in AFTER_NEXT.M with the given input arguments.
%
%      AFTER_NEXT('Property','Value',...) creates a new AFTER_NEXT or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before after_next_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to after_next_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help after_next

% Last Modified by GUIDE v2.5 20-Apr-2019 16:25:25

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
    'gui_Singleton',  gui_Singleton, ...
    'gui_OpeningFcn', @after_next_OpeningFcn, ...
    'gui_OutputFcn',  @after_next_OutputFcn, ...
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


% --- Executes just before after_next is made visible.
function after_next_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to after_next (see VARARGIN)

% Choose default command line output for after_next
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);
global filename1;
filename1 =getappdata(0,'filename');
set(handles.pushbutton1,'String',filename1);

% UIWAIT makes after_next wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = after_next_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global filename1;
filename1 =getappdata(0,'filename');
stl_read1(filename1);
set(handles.pushbutton1,'String',filename1);


function stl_read1(filename1)
%- Let's storage the vertices in an array.
fid     = fopen(filename1,'r');
regex   = '\s*vertex\s*([-]?(?:[0-9]*[.])?[0-9]+)\s*([-]?(?:[0-9]*[.])?[0-9]+)\s*([-]?(?:[0-9]*[.])?[0-9]+)';
line_ex = fgetl(fid);
i = 1;
j = 1;
while ~feof(fid)
    line_ex = fgetl(fid);
    if regexp(line_ex,regex)
        toks   = regexp(line_ex, regex, 'tokens');
        %- Points
        p{i,1} = str2double(toks{:}{1});
        p{i,2} = str2double(toks{:}{3});
        p{i,3} = str2double(toks{:}{2});
        %p{i,4} = 1;
        %- Counter
        i = i + 1;
    end
end
fclose(fid);
%- Indices.
k = 1;
for j = 1:(size(p,1)/3)
    t{j,1} = k;
    t{j,2} = k+1;
    t{j,3} = k+2;
    k = k + 3;
end
%- Okay. Let's graph.
t = double(cell2mat(t));
p = double(cell2mat(p));
TR = triangulation(t,p);
trisurf(TR);


% for j = 45:45:360
%     for i= 20:5:180
%         
%         trisurf(TR);
%         view(0,i);
%         pause(.5)
%         hold on
%     end
% end



% --- Executes during object creation, after setting all properties.
function axes1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to axes1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate axes1

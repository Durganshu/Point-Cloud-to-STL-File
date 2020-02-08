function varargout = Project(varargin)
% PROJECT MATLAB code for Project.fig
%      PROJECT, by itself, creates a new PROJECT or raises the existing
%      singleton*.
%
%      H = PROJECT returns the handle to a new PROJECT or the handle to
%      the existing singleton*.
%
%      PROJECT('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in PROJECT.M with the given input arguments.
%
%      PROJECT('Property','Value',...) creates a new PROJECT or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Project_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Project_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Project

% Last Modified by GUIDE v2.5 23-Apr-2019 02:44:56

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
    'gui_Singleton',  gui_Singleton, ...
    'gui_OpeningFcn', @Project_OpeningFcn, ...
    'gui_OutputFcn',  @Project_OutputFcn, ...
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
end

% --- Executes just before Project is made visible.
function Project_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Project (see VARARGIN)

% Choose default command line output for Project
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Project wait for user response (see UIRESUME)
% uiwait(handles.figure1);

end
% --- Outputs from this function are returned to the command line.
function varargout = Project_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;
end
function input1_Callback(hObject, eventdata, handles)
% hObject    handle to input1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of input1 as text
%        str2double(get(hObject,'String')) returns contents of input1 as a double

end
% --- Executes during object creation, after setting all properties.
function input1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to input1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

end
function input3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to input1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
end
function input2_Callback(hObject, eventdata, handles)
% hObject    handle to input2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of input2 as text
%        str2double(get(hObject,'String')) returns contents of input2 as a double

end
% --- Executes during object creation, after setting all properties.
function input3_Callback(hObject, eventdata, handles)
% hObject    handle to input2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of input2 as text
%        str2double(get(hObject,'String')) returns contents of input2 as a double

end
function input2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to input2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
end
% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% node_file_name=get(handles.input1, 'string');
% triangle_file_name=get(handles.input2, 'string');
global f3;
global f2;
% global filename;
stla_file_name=get(handles.input3, 'string');
setappdata(0,'filename',stla_file_name);
point_to_stl ( f2, f3, stla_file_name );
close;
run('after_next.m');
end
% --- Executes on button press in button3.
function button3_Callback(hObject, eventdata, handles)
global f3;
[file, path]= uigetfile('*.*');
f3=[path,file];
set(handles.display2, 'String', file);
end
% --- Executes on button press in button2.
function button2_Callback(hObject, eventdata, handles)
global f2;
% hObject    handle to button2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[file, path]= uigetfile('*.*');
f2=[path,file];
set(handles.display1, 'String', file);
end

function point_to_stl ( node_file_name, triangle_file_name, stla_file_name )
timestamp ( );

[ dim_num, node_num, order_num, triangle_num ] = file_size ( ...
    node_file_name, triangle_file_name );

fprintf ( 1, '\n' );
fprintf ( 1, '  TRI_SURFACE data:\n' );
fprintf ( 1, '  node file     "%s".\n', node_file_name );
fprintf ( 1, '  triangle_file "%s".\n', triangle_file_name );
fprintf ( 1, '\n' );
fprintf ( 1, '  Spatial dimension   = %d\n', dim_num );
fprintf ( 1, '  Number of nodes     = %d\n', node_num );
fprintf ( 1, '  Triangle order      = %d\n', order_num );
fprintf ( 1, '  Number of triangles = %d\n', triangle_num );
[ node_xyz, triangle_node ] = tri_surface_read ( node_file_name, ...
    triangle_file_name, dim_num, node_num, order_num, triangle_num );
triangle_normal = stla_face_normal_compute ( node_num, triangle_num, ...
    node_xyz, triangle_node );

stla_write ( stla_file_name, node_num, triangle_num, node_xyz, ...
    triangle_node, triangle_normal );

fprintf ( 1, '\n' );
fprintf ( 1, '  STLA data written to "%s".\n', stla_file_name );

fprintf ( 1, '\n' );
fprintf ( 1, 'TRI_SURFACE_TO_STLA:\n' );
fprintf ( 1, '  Normal end of execution.\n' );
fprintf ( 1, '\n' );
timestamp ( );

return
end
function column_num = file_column_count ( input_file_name )

FALSE = 0;
TRUE = 1;
input_file_name;
input_unit = fopen ( input_file_name,'r' );

if ( input_unit < 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'FILE_COLUMN_COUNT - Error!\n' );
    fprintf ( 1, '  Could not open the file "%s".\n', input_file_name );
    error ( 'FILE_COLUMN_COUNT - Error!' );
end

got_one = FALSE;

while ( 1 )
    
    line = fgetl ( input_unit );
    
    if ( line == -1 )
        break;
    end
    
    if ( s_len_trim ( line ) == 0 )
        
    elseif ( line(1) == '#' )
        
    else
        got_one = TRUE;
        break;
    end
    
end

fclose ( input_unit );

if ( got_one == FALSE )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'FILE_COLUMN_COUNT - Warning!\n' );
    fprintf ( 1, '  The file does not seem to contain any data.\n' );
    column_num = -1;
    return;
end

column_num = s_word_count ( line );

return
end
function row_num = file_row_count ( input_file_name )

input_unit = fopen ( input_file_name );

if ( input_unit < 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'FILE_ROW_COUNT - Error!\n' );
    fprintf ( 1, '  Could not open the file "%s".\n', input_file_name );
    error ( 'FILE_ROW_COUNT - Error!' );
end

blank_num = 0;
comment_num = 0;
row_num = 0;

record_num = 0;

while ( 1 )
    
    line = fgetl ( input_unit );
    
    if ( line == -1 )
        break;
    end
    
    record_num = record_num + 1;
    record_length = s_len_trim ( line );
    
    if ( record_length <= 0 )
        blank_num = blank_num + 1;
    elseif ( line(1) == '#' )
        comment_num = comment_num + 1;
    else
        row_num = row_num + 1;
    end
    
end

fclose ( input_unit );

return
end
function table = i4mat_data_read ( input_filename, m, n )
table = zeros ( m, n );
string = ' ';

for i = 0 : m
    string = strcat ( string, ' %d' );
end

input_unit = fopen ( input_filename );

if ( input_unit < 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'I4MAT_DATA_READ - Error!\n' );
    fprintf ( 1, '  Could not open the input file.\n' );
    error ( 'I4MAT_DATA_READ - Error!' );
end

i = 0;

while ( i < n )
    
    line = fgets ( input_unit );
    
    if ( line == -1 )
        fprintf ( 1, '\n' );
        fprintf ( 1, 'I4MAT_DATA_READ - Error!\n' );
        fprintf ( 1, '  End of input while reading data.\n' );
        error ( 'I4MAT_DATA_READ - Error!' );
    end
    
    if ( line(1) == '#' )
        
    elseif ( s_len_trim ( line ) == 0 )
        
    else
        
        [ x, count ] = sscanf ( line, string );
        
        if ( count == m )
            i = i + 1;
            table(1:m,i) = x(1:m);
        end
        
    end
    
end

fclose ( input_unit );

return
end
function [ m, n ] = i4mat_header_read ( input_filename )
m = file_column_count ( input_filename );

if ( m <= 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'I4MAT_HEADER_READ - Fatal error!\n' );
    fprintf ( 1, '  There was some kind of I/O problem while trying\n' );
    fprintf ( 1, '  to count the number of data columns in\n' );
    fprintf ( 1, '  the file %s.\n', input_filename );
end

n = file_row_count ( input_filename );

if ( n <= 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'I4MAT_HEADER_READ - Fatal error!\n' );
    fprintf ( 1, '  There was some kind of I/O problem while trying\n' );
    fprintf ( 1, '  to count the number of data rows in\n' );
    fprintf ( 1, '  the file %s\n', input_filename );
end

return
end
function table = r8mat_data_read ( input_filename, m, n )
string = ' ';

for i = 0 : m
    string = strcat ( string, ' %f' );
end

input_unit = fopen ( input_filename );

if ( input_unit < 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'R8MAT_DATA_READ - Error!\n' );
    fprintf ( 1, '  Could not open the file.\n' );
    error ( 'R8MAT_DATA_READ - Error!' );
end

i = 0;

while ( i < n )
    
    line = fgets ( input_unit );
    
    if ( line == -1 )
        break;
    end
    
    if ( line(1) == '#' )
        
    elseif ( s_len_trim ( line ) == 0 )
        
    else
        
        [ x, count ] = sscanf ( line, string );
        
        if ( count == m )
            i = i + 1;
            table(1:m,i) = x(1:m);
        end
        
    end
    
end

fclose ( input_unit );

return
end
function [ m, n ] = r8mat_header_read ( input_filename )
m = file_column_count ( input_filename );

if ( m <= 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'R8MAT_HEADER_READ - Fatal error!\n' );
    fprintf ( 1, '  There was some kind of I/O problem while trying\n' );
    fprintf ( 1, '  to count the number of data columns in\n' );
    fprintf ( 1, '  the file %s.\n', input_filename );
end

n = file_row_count ( input_filename );

if ( n <= 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'R8MAT_HEADER_READ - Fatal error!\n' );
    fprintf ( 1, '  There was some kind of I/O problem while trying\n' );
    fprintf ( 1, '  to count the number of data rows in\n' );
    fprintf ( 1, '  the file %s\n', input_filename );
end

return
end
function v3 = r8vec_cross_3d ( v1, v2 )
v3(1) = v1(2) * v2(3) - v1(3) * v2(2);
v3(2) = v1(3) * v2(1) - v1(1) * v2(3);
v3(3) = v1(1) * v2(2) - v1(2) * v2(1);

return
end
function len = s_len_trim ( s )
len = length ( s );

while ( 0 < len )
    if ( s(len) ~= ' ' )
        return
    end
    len = len - 1;
end

return
end
function word_num = s_word_count ( s )
FALSE = 0;
TRUE = 1;

word_num = 0;
s_length = length ( s );

if ( s_length <= 0 )
    return;
end

blank = TRUE;

for i = 1 : s_length
    
    if ( s(i) == ' ' )
        blank = TRUE;
    elseif ( blank == TRUE )
        word_num = word_num + 1;
        blank = FALSE;
    end
    
end

return
end
function face_normal = stla_face_normal_compute ( node_num, face_num, ...
    node_xyz, face_node )
face_normal = zeros ( 3, face_num );

for face = 1 : face_num
    
    n1 = face_node(1,face);
    n2 = face_node(2,face);
    n3 = face_node(3,face);
    
    v1(1:3) = node_xyz(1:3,n2) - node_xyz(1:3,n1);
    v2(1:3) = node_xyz(1:3,n3) - node_xyz(1:3,n1);
    
    face_normal(1:3,face) = r8vec_cross_3d ( v1, v2 );
    
    norm = sqrt ( sum ( ( face_normal(1:3,face) ).^2 ) );
    
    if ( norm ~= 0.0 )
        face_normal(1:3,face) = face_normal(1:3,face) / norm;
    end
    
end

return
end
function stla_write ( output_file_name, node_num, face_num, node_xyz, ...
    face_node, face_normal )
text_num=0;
iunit = fopen ( output_file_name, 'w' );

if ( iunit < 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'STLA_WRITE - Fatal error!\n' );
    fprintf ( 1, '  Could not open the file "%s".\n', output_file_name );
    error ( 'STLA_WRITE - Fatal error!' );
end

fprintf ( iunit, 'solid MYSOLID\n' );
text_num = text_num + 1;

for face = 1 : face_num
    
    fprintf ( iunit, '  facet normal  %14f  %14f  %14f\n', ...
        face_normal(1:3,face) );
    text_num = text_num + 1;
    
    fprintf ( iunit, '    outer loop\n' );
    text_num = text_num + 1;
    
    for vertex = 1 : 3
        
        node = face_node(vertex,face);
        
        fprintf ( iunit, '      vertex    %14f  %14f  %14f\n', ...
            node_xyz(1:3,node) );
        text_num = text_num + 1;
        
    end
    
    fprintf ( iunit, '    end loop\n' );
    text_num = text_num + 1;
    fprintf ( iunit, '  end facet\n' );
    text_num = text_num + 1;
    
end

fprintf ( iunit, 'end solid MYSOLID\n' );

fclose ( iunit );

return
end
function timestamp ( )
t = now;
c = datevec ( t );
s = datestr ( c, 0 );
fprintf ( 1, '%s\n', s );

return
end
function [ node_xyz, triangle_node ] = tri_surface_read ( node_file_name, ...
    triangle_file_name, dim_num, node_num, order_num, triangle_num )


node_xyz = r8mat_data_read ( node_file_name, dim_num, node_num );

triangle_node = i4mat_data_read ( triangle_file_name, order_num, ...
    triangle_num );

return
end
function [ dim_num, node_num, order_num, triangle_num ] = file_size ( ...
    node_file_name, triangle_file_name )
[ dim_num, node_num ] = r8mat_header_read ( node_file_name );

if ( dim_num < 2 || 3 < dim_num )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'file_size - Warning!\n' );
    fprintf ( 1, '  The spatial dimension DIM_NUM = %d\n', dim_num );
    fprintf ( 1, '  This seems an unlikely value.\n' );
end

[ order_num, triangle_num ] = i4mat_header_read ( triangle_file_name );

if ( order_num ~= 3 && order_num ~= 6 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'file_size - Fatal error!\n' );
    fprintf ( 1, '  The "order" of the triangles seems to be %d\n', order_num );
    fprintf ( 1, '  Only the values 3 and 6 are acceptable.\n' );
    error ( 'file_size - Fatal error!\n' );
end

return
end


% --- Executes during object creation, after setting all properties.
function display1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to display1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
end

% --- Executes during object creation, after setting all properties.
function display2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to display2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
end


% --- Executes on button press in radiobutton2.
function radiobutton2_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
GE = char(hex2dec('2265'));
test = uicontrol('Style','text','String', GE)
% Hint: get(hObject,'Value') returns toggle state of radiobutton2
end

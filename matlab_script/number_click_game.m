function varargout = number_click_game(varargin)
% NUMBER_CLICK_GAME MATLAB code for number_click_game.fig
%      NUMBER_CLICK_GAME, by itself, creates a new NUMBER_CLICK_GAME or raises the existing
%      singleton*.
%
%      H = NUMBER_CLICK_GAME returns the handle to a new NUMBER_CLICK_GAME or the handle to
%      the existing singleton*.
%
%      NUMBER_CLICK_GAME('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in NUMBER_CLICK_GAME.M with the given input arguments.
%
%      NUMBER_CLICK_GAME('Property','Value',...) creates a new NUMBER_CLICK_GAME or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before number_click_game_OpeningFcn gets called.  An
%      unrecognized property or invalid value makes the property get ignored.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help number_click_game

% Last Modified by GUIDE v2.5 24-Dec-2024

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename,...
                   'gui_Singleton',  gui_Singleton,...
                   'gui_OpeningFcn', @number_click_game_OpeningFcn,...
                   'gui_ClosingFcn', @number_click_game_ClosingFcn,...
                   'gui_OutputFcn', @number_click_game_OutputFcn, ...
                   'gui_LayoutFcn',  [],...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = strcat(varargin{:});
end
if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before number_click_game is made visible.
function number_click_game_OpeningFcn(hObject, eventData, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventData  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to the function (see VARARGIN)

% Choose default command line input for number_click_game
handles.output = hObject;

% Initialize the grid and numbers
nums = reshape(1:25, 5, 5); % Create 1-25 in 5x5 matrix
handles.numbers = nums;
handles.clicked_numbers = []; % Record clicked numbers
handles.start_time = []; % Record start time

% Create buttons for the grid
button_width = 0.2; % Width of each button relative to figure width
button_height = 0.2; % Height of each button relative to figure height
for row = 1:5
    for col = 1:5
        button_pos = [col * button_width - button_width, 1 - row * button_height, button_width, button_height];
        btn = uicontrol('Style', 'pushbutton', 'String', num2str(nums(row, col)), 'Position', button_pos,...
                        'Parent', hObject, 'Callback', {@button_callback, row, col});
    end
end

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes number_click_game wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = number_click_game_OutputFcn(hObject, eventData, handles)
% varargout  cell array for returning output args (see VARARGIN)
% hObject    handle to figure
% eventData  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default output from handles structure
varargout{1} = handles.output;
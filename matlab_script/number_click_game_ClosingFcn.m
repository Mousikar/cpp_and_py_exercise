% --- Executes when user attempts to close number_click_game.
function varargout = number_click_game_ClosingFcn(hObject, eventData, handles)
% hObject    handle to figure
% eventData  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default output from handles structure
varargout{1} = handles.output;
% Hint: delete(hObject) closes the figure
delete(hObject);
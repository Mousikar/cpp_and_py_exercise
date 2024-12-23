% --- Executes on button press in the grid buttons.
function button_callback(hObject, eventData, row, col)
% hObject    handle to the button that was clicked (see GCBO)
% eventData  reserved - to be defined in a future version of MATLAB
% row, col   row and column indices of the button in the grid

handles = guidata(gcbf); % Get the handles structure

num = handles.numbers(row, col); % Get the number on the clicked button

if isempty(handles.start_time) && num == 1 % If start time not set and clicked 1, start timing
    handles.start_time = tic;
elseif ~isempty(handles.clicked_numbers) && num ~= handles.clicked_numbers(end) + 1
    % If clicked number is not in correct order
    warndlg('Please click the numbers in increasing order!');
    return;
end

handles.clicked_numbers = [handles.clicked_numbers, num]; % Record clicked number

if length(handles.clicked_numbers) == 25 % If all numbers clicked in order
    elapsed_time = toc(handles.start_time); % Stop timing
    msgbox(sprintf('Congratulations! You completed it in %.2f seconds.', elapsed_time));
end

guidata(gcbf, handles); % Update the handles structure
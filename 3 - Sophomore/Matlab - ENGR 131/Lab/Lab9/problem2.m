% Jacob Alspaw
% jaa134

function problem2
% A function that will create a GUI.
%   A function that will create a GUI that contains three static text
%   boxes, two edit boxes, and one button. The button will find a sum.
fig = figure('Position', [600 400 400 300], 'Visible', 'off', 'MenuBar', 'none');
static1 = uicontrol('Style', 'text', 'Position', [1 250 400 40], 'String', 'Enter the first number:');
edit1 = uicontrol('Style', 'edit', 'Position', [1 200 400 40]);
static2 = uicontrol('Style', 'text', 'Position', [1 150 400 40], 'String', 'Enter the second number:');
edit2 = uicontrol('Style', 'edit', 'Position', [1 100 400 40]);
static3 = uicontrol('Style', 'text', 'Position', [1 50 400 40], 'String', 'The sum is...');
button = uicontrol('Style', 'pushbutton', 'String', 'Add', 'Position',[1 1 400 40], 'Callback', @cbfunc);
set(fig, 'Visible', 'on');
    % button callback
    function cbfunc(arg1, arg2)
        n1 = str2num(get(edit1, 'String'));
        n2 = str2num(get(edit2, 'String'));
        sumText = sprintf('The sum is %f.', n1 + n2);
        set(static3, 'String', sumText)
    end
end


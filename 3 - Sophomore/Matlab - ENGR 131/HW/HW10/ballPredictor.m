% Jacob Alspaw
% jaa134

function ballPredictor
app = figure('Name', 'Position Predictor', 'Position', [1 1 350 300], 'Visible', 'off', 'MenuBar', 'none', 'color', 'white');
staticFrame1 = uicontrol('Style', 'text', 'Position', [1 250 175 40], 'String', 'Frame (time):', 'BackgroundColor', 'white');
staticFrame2 = uicontrol('Style', 'text', 'Position', [175 250 175 40], 'String', 'Pixel (height):', 'BackgroundColor', 'white');
edit1 = uicontrol('Style', 'edit', 'Position', [1 200 175 40], 'String', '97');
edit2 = uicontrol('Style', 'edit', 'Position', [1 150 175 40], 'String', '102');
edit3 = uicontrol('Style', 'edit', 'Position', [1 100 175 40], 'String', '107');
edit4 = uicontrol('Style', 'edit', 'Position', [1 50 175 40], 'String', '111');
edit5 = uicontrol('Style', 'edit', 'Position', [175 200 175 40], 'String', '209');
edit6 = uicontrol('Style', 'edit', 'Position', [175 150 175 40], 'String', '439');
edit7 = uicontrol('Style', 'edit', 'Position', [175 100 175 40], 'String', '803');
edit8 = uicontrol('Style', 'edit', 'Position', [175 50 175 40], 'BackgroundColor', 'white');
button1 = uicontrol('Style', 'pushbutton', 'String', 'Predict with "polyfit"', 'Position',[1 1 175 40], 'Callback', @doPolyfit);
button2 = uicontrol('Style', 'pushbutton', 'String', 'Predict with "inv"', 'Position',[175 1 175 40], 'Callback', @doInv);
movegui(app, 'center');
set(app, 'Visible', 'on');
    function doPolyfit(source,eventdata)
        frames = [str2num(get(edit1, 'String')) str2num(get(edit2, 'String')) str2num(get(edit3, 'String'))];
        pixels = [str2num(get(edit5, 'String')) str2num(get(edit6, 'String')) str2num(get(edit7, 'String'))];
        coefficients = polyfit(frames, pixels, 2);
        frameReq = str2num(get(edit4, 'String'));
        pixelEstimate = polyval(coefficients, frameReq);
        set(edit8, 'String', pixelEstimate)
    end
    function doInv(source,eventdata)
        A = [str2num(get(edit1, 'String'))^2 str2num(get(edit1, 'String')) 1; str2num(get(edit2, 'String'))^2 str2num(get(edit2, 'String')) 1; str2num(get(edit3, 'String'))^2 str2num(get(edit3, 'String')) 1];
        b = [str2num(get(edit4, 'String')); str2num(get(edit5, 'String')); str2num(get(edit6, 'String'))];
        coefficients = inv(A) * b;
        frameReq = str2num(get(edit4, 'String'));
        pixelEstimate = polyval(coefficients, frameReq);
        set(edit8, 'String', pixelEstimate)
    end
end

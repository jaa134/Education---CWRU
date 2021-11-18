% Jacob Alspaw
% jaa134

function curveFitting
app = figure('Position', [1 1 500 475], 'Visible', 'off', 'MenuBar', 'none', 'color', 'white');
staticFrame1 = uicontrol('Style', 'text', 'Position', [1 50 125 50], 'String', 'Filename:', 'BackgroundColor', 'white');
staticFrame2 = uicontrol('Style', 'text', 'Position', [250 50 125 50], 'String', 'Order (1 or more):', 'BackgroundColor', 'white');
edit1 = uicontrol('Style', 'edit', 'Position', [125 50 100 50], 'String', 'temperatures.txt');
edit2 = uicontrol('Style', 'edit', 'Position', [375 50 100 50], 'String', '1');
button = uicontrol('Style', 'pushbutton', 'String', 'Update', 'Position',[1 1 500 40], 'Callback', @onBtnPress);
axes('Units', 'Pixels', 'Position', [50 150 425 300]);
movegui(app, 'center')
set(app, 'Visible', 'on')
    function onBtnPress(source,eventdata)
        fid = fopen(get(edit1, 'String'));
        if fid ~= -1
            temperatures = fscanf(fid, '%f %f', [2 inf]);
            fclose(fid);
            xVals = temperatures(1,:);
            yVals = temperatures(2,:);
            order = str2num(get(edit2, 'String'));
            if order >= 1
                coeffecients = polyfit(xVals, yVals, order);
                xAxis = min(xVals) - 1 : 0.1 : max(xVals) + 1;
                line = polyval(coeffecients, xAxis);
                plot(xAxis, line, xVals, yVals, 'ro');
                title(['Order = ' num2str(order)]);
                xlabel('x');
                ylabel('y');
                legend('Model', 'Raw Data');
                if order >= xVals
                    warndlg('Polynomial is not unique; degree >= number of data points.');
                end
            else
                errordlg('Polynomial order must be at least 1.','Error');
            end
        else
            errordlg('ERROR: Could not open file.','Error');
        end
    end
end

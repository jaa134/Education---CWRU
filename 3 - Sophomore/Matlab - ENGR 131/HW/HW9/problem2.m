% Jacob Alspaw
% jaa134

function problem2
f = figure('Position', [1 1 300 480], 'Visible', 'off', 'MenuBar', 'none', 'color', 'white');
movegui(f, 'center')
axes('Units', 'Pixels', 'Position', [60 260 225 175]);
static1 = uicontrol('Style', 'text', 'Position', [1 150 150 40], 'String', 'Initial velocity:', 'BackgroundColor', 'white');
edit1 = uicontrol('Style', 'edit', 'Position', [150 150 120 40], 'String', '10');
static2 = uicontrol('Style', 'text', 'Position', [1 100 150 40], 'String', 'Initial height:', 'BackgroundColor', 'white');
edit2 = uicontrol('Style', 'edit', 'Position', [150 100 120 40], 'String', '5');
static3 = uicontrol('Style', 'text', 'Position', [1 50 150 40], 'String', 'Ending time:', 'BackgroundColor', 'white');
edit3 = uicontrol('Style', 'edit', 'Position', [150 50 120 40], 'String', '3');
button = uicontrol('Style', 'pushbutton', 'String', 'Compute', 'Position', [1 1 300 40], 'Callback', @compute);
set(f, 'Visible', 'on')
    function compute(source,eventdata)
        v0 = str2num(get(edit1, 'String'));
        h0 = str2num(get(edit2, 'String'));
        tF = str2num(get(edit3, 'String'));
        accel = -0.5 * 9.8;
        t = 0:0.01:tF;
        h = accel * t .^ 2 + v0 * t + h0;
        hold off
        plot(t, h)
        xlabel('Time (s)')
        ylabel('Height (m)')
        title('Height vs. Time')
        grid on
        if (v0 ^ 2) >= (4 * accel * h0)
            hold on
            impactT = (-v0 - sqrt(v0 ^ 2 - (4 * accel * h0))) / (2 * accel);
            if impactT >= 0
                plot(impactT, 0, 'ro')
            end
            impactT = (-v0 + sqrt(v0 ^ 2 - (4 * accel * h0))) / (2 * accel);
            if impactT >= 0
                plot(impactT, 0, 'ro')
            end
        end
    end
end

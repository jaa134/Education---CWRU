% Jacob Alspaw
% jaa134

function analyzer
app = figure('Name', 'Analyzer', 'Position', [1 1 900 650], 'Visible', 'off', 'MenuBar', 'none', 'color', 'white');
loadBtn = uicontrol('Style', 'pushbutton', 'String', 'Load File', 'Position',[1 1 300 40], 'Callback', @loadFile);
prevBtn = uicontrol('Style', 'pushbutton', 'String', 'Previous Frame', 'Position',[300 1 300 40], 'Callback', @previousFrame);
nextBtn = uicontrol('Style', 'pushbutton', 'String', 'Next Frame', 'Position',[600 1 300 40], 'Callback', @nextFrame);
edit0 = uicontrol('Style', 'edit', 'Position', [160 50 115 50], 'String', '97', 'Callback', @updateApp);
edit1 = uicontrol('Style', 'edit', 'Position', [160 90 115 50], 'String', 'ball.mp4');
edit2 = uicontrol('Style', 'edit', 'Position', [750 90 115 50], 'String', '220', 'Callback', @updateApp);
edit3 = uicontrol('Style', 'edit', 'Position', [450 90 115 50], 'String', '400', 'Callback', @updateApp);
edit4 = uicontrol('Style', 'edit', 'Position', [150*5 50 115 50], 'String', '200', 'Callback', @updateApp);
static1 = uicontrol('Style', 'text', 'Position', [1 60 150 50], 'String', 'File:', 'BackgroundColor', 'white');
static2 = uicontrol('Style', 'text', 'Position', [1 50 150 25], 'String', 'Movie Frame #:', 'BackgroundColor', 'white');
static3 = uicontrol('Style', 'text', 'Position', [600 70 150 50], 'String', 'Threshold:', 'BackgroundColor', 'white');
static4 = uicontrol('Style', 'text', 'Position', [300 70 150 50], 'String', 'Image Pixel #:', 'BackgroundColor', 'white');
static5 = uicontrol('Style', 'text', 'Position', [600 50 150 25], 'String', 'Left limit:', 'BackgroundColor', 'white');
axes1 = axes('Units', 'Pixels', 'Position', [50 150 825 220]);
axes2 = axes('Units', 'Pixels', 'Position', [50 400 825 230]);
loadMessage = text(0.2, 0.5, 'Click "Load File" Button');
set(loadMessage, 'FontSize', 30);
movegui(app, 'center');
set(app, 'Visible', 'on');
video = [];
    function loadFile(source,eventdata)
        video = VideoReader(get(edit1, 'String'));
        changeFrame(0);
    end
    function previousFrame(source,eventdata)
        changeFrame(-1);
    end
    function nextFrame(source,eventdata)
        changeFrame(+1);
    end
    function updateApp(source,eventdata)
        changeFrame(0);
    end
    function changeFrame(direction)
        frameNum = str2num(get(edit0, 'String'));
        if frameNum + direction >= 1 && video.NumberOfFrames >= frameNum + direction 
            newFrameNum = frameNum + direction;
            pic = read(video, newFrameNum);
            set(edit0, 'String', num2str(newFrameNum));
            axes(axes2);
            image(pic);
            [row, column, ~] = size(pic);
            hold on;
            pixelNum = str2num(get(edit3, 'String'));
            plot([0 column], [pixelNum pixelNum], 'r');
            profile = pic(pixelNum,:,1);
            leftLimit = str2num(get(edit4, 'String'));
            profile(1:leftLimit) = 0;
            axes(axes1);
            cla
            plot(profile);
            hold on;
            axis([0 column 0 256]);
            threshold = str2num(get(edit2, 'String'));
            plot([0 column], [threshold threshold], 'r');
            pixelsPastThresh = find(profile > threshold);
            if ~isempty(pixelsPastThresh)
                title(['Crosses threshold at pixel #' num2str(pixelsPastThresh(1))]);
                plot([pixelsPastThresh(1) pixelsPastThresh(1)], [0 row], 'g');
            else
                title('ERROR: Could not find threshold crossing.');
            end
        end
    end
end

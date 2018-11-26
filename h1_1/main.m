
% 待分析的音频文件名
audioFiles = {'0_number.m4a', '1_number.m4a', '2_number.m4a', '3_number.m4a', '4_number.m4a', '5_number.m4a', '6_number.m4a', '7_number.m4a', '8_number.m4a', '9_number.m4a', 'sharp_symbol.m4a', 'star_symbol.m4a'};

% MP3格式的采样率一般为44100
fs = 44100;

% 待匹配的答案
answers = {'0', '1', '2', '3', '4', '5', '6', '7', '8', '9', '#', '*'};

% 8种不同的频率
dtmf = [697, 770, 852, 941, 1209, 1336, 1477, 1633]; 

% 键盘上的16个双音频不同的按键
keys = ['1','2','3','A';'4','5','6','B';'7','8','9','C';'*','0','#','D'];

% 使用fft方法检测12个信号
for signal = 1:12
    % 打印出真正的答案
    disp('the true answer is ');
    disp(answers(signal));
    % audioread函数读取电脑中的音频文件
    % audioSignalData是提取出来的音频信号数据
    % fs是音频采样率
    [audioSignalData, fs] = audioread(audioFiles{signal});
    % 开始计时
    tic;
    % 调用分析函数得出结果
    fftAnswer = FFTPredict(audioSignalData, fs, dtmf, keys);
    % 停止计时
    toc;
    % 打印出结果
    disp('the fft answer is ');
    disp(fftAnswer);
end

% 使用Goertzel方法检测12个信号
for signal = 1:12
    % 打印出真正的答案
    disp('the true answer is ');
    disp(answers(signal));
    % audioread函数读取电脑中的音频文件
    % audioSignalData是提取出来的音频信号数据
    % fs是音频采样率
    [audioSignalData, fs] = audioread(audioFiles{signal});
    % 开始计时
    tic;
    % 调用分析函数得出结果
    GoertzelAnswer = GoertzelPredict(audioSignalData, fs, dtmf, keys);
    % 停止计时
    toc;
    % 打印出结果
    disp('the Goertzel answer is ');
    disp(GoertzelAnswer);
end



% 8种不同的频率
dtmf = [697, 770, 852, 941, 1209, 1336, 1477, 1633]; 

% 键盘上的16个双音频不同的按键
keys = ['1','2','3','A';'4','5','6','B';'7','8','9','C';'*','0','#','D'];

% 读入待叠加的语音片段文件
[audioFile0, fs] = audioread('0_number.m4a');
[audioFile1, fs] = audioread('1_number.m4a');
[audioFile6, fs] = audioread('6_number.m4a');

% 待叠加的语音片段的时长(单位：s)
duration = 1;

% 总采样点数
N = 0 : duration * fs - 1;

% 提取定长的语音片段
audioFile0 = audioFile0(1 : duration * fs, : );
audioFile1 = audioFile1(1 : duration * fs, : );
audioFile6 = audioFile6(1 : duration * fs, : );

% 作三个语音样本的频谱分析图
% 注意：
% stem 和 plot 的区别：stem作离散图，plot作连续图
figure(1);
subplot(311);
stem(N, abs(fft(audioFile0)), '.');
subplot(312);
stem(N, abs(fft(audioFile1)), '.');
subplot(313);
stem(N, abs(fft(audioFile6)), '.');

a1 = 4 * audioFile0' .* cos(2 * pi * 5000 * N / fs);     
a2 = 4 * audioFile1' .* cos(2 * pi * 10000 * N /fs);    
a3 = 4 * audioFile6' .* cos(2 * pi * 15000 * N /fs); 

% 将三个信号叠加
superPosition = a1 + a2 + a3;

% 作叠加后信号的DFT图
figure(2);
stem(N, abs(fft(superPosition)),'.');

% 使用BandFilter将信号分离
bandfilAudio1 = BandFilter([4000 8000], [3800 8500], superPosition);
bandfilAudio2 = BandFilter([9000 13000], [8000 14000], superPosition);
bandfilAudio3 = BandFilter([14500 18500], [14000 19000], superPosition);

% 解调
demoduledAudio1 = bandfilAudio1 .* cos(2 * pi * 5000 * N / fs);
demoduledAudio2 = bandfilAudio2 .* cos(2 * pi * 10000 * N / fs);
demoduledAudio3 = bandfilAudio3 .* cos(2 * pi * 15000 * N / fs);

% 低通滤波,得到结果
lowpassfilAudio1 = BandFilter(4500, 5000, demoduledAudio1);
lowpassfilAudio2 = BandFilter(4500, 5000, demoduledAudio2);
lowpassfilAudio3 = BandFilter(4500, 5000, demoduledAudio3);

% 作叠加后的信号分频处理后的信号图
figure(3);
subplot(311);
stem(N, abs(fft(lowpassfilAudio1)));
subplot(312);
stem(N, abs(fft(lowpassfilAudio2)));
subplot(313);
stem(N, abs(fft(lowpassfilAudio3)));

% 使用T1中的FFT方法预测结果
disp(FFTPredict(lowpassfilAudio1, fs, dtmf, keys));
disp(FFTPredict(lowpassfilAudio2, fs, dtmf, keys));
disp(FFTPredict(lowpassfilAudio3, fs, dtmf, keys));


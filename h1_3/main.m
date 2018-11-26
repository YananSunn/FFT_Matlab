
% 8�ֲ�ͬ��Ƶ��
dtmf = [697, 770, 852, 941, 1209, 1336, 1477, 1633]; 

% �����ϵ�16��˫��Ƶ��ͬ�İ���
keys = ['1','2','3','A';'4','5','6','B';'7','8','9','C';'*','0','#','D'];

% ��������ӵ�����Ƭ���ļ�
[audioFile0, fs] = audioread('0_number.m4a');
[audioFile1, fs] = audioread('1_number.m4a');
[audioFile6, fs] = audioread('6_number.m4a');

% �����ӵ�����Ƭ�ε�ʱ��(��λ��s)
duration = 1;

% �ܲ�������
N = 0 : duration * fs - 1;

% ��ȡ����������Ƭ��
audioFile0 = audioFile0(1 : duration * fs, : );
audioFile1 = audioFile1(1 : duration * fs, : );
audioFile6 = audioFile6(1 : duration * fs, : );

% ����������������Ƶ�׷���ͼ
% ע�⣺
% stem �� plot ������stem����ɢͼ��plot������ͼ
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

% �������źŵ���
superPosition = a1 + a2 + a3;

% �����Ӻ��źŵ�DFTͼ
figure(2);
stem(N, abs(fft(superPosition)),'.');

% ʹ��BandFilter���źŷ���
bandfilAudio1 = BandFilter([4000 8000], [3800 8500], superPosition);
bandfilAudio2 = BandFilter([9000 13000], [8000 14000], superPosition);
bandfilAudio3 = BandFilter([14500 18500], [14000 19000], superPosition);

% ���
demoduledAudio1 = bandfilAudio1 .* cos(2 * pi * 5000 * N / fs);
demoduledAudio2 = bandfilAudio2 .* cos(2 * pi * 10000 * N / fs);
demoduledAudio3 = bandfilAudio3 .* cos(2 * pi * 15000 * N / fs);

% ��ͨ�˲�,�õ����
lowpassfilAudio1 = BandFilter(4500, 5000, demoduledAudio1);
lowpassfilAudio2 = BandFilter(4500, 5000, demoduledAudio2);
lowpassfilAudio3 = BandFilter(4500, 5000, demoduledAudio3);

% �����Ӻ���źŷ�Ƶ�������ź�ͼ
figure(3);
subplot(311);
stem(N, abs(fft(lowpassfilAudio1)));
subplot(312);
stem(N, abs(fft(lowpassfilAudio2)));
subplot(313);
stem(N, abs(fft(lowpassfilAudio3)));

% ʹ��T1�е�FFT����Ԥ����
disp(FFTPredict(lowpassfilAudio1, fs, dtmf, keys));
disp(FFTPredict(lowpassfilAudio2, fs, dtmf, keys));
disp(FFTPredict(lowpassfilAudio3, fs, dtmf, keys));


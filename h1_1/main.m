
% ����������Ƶ�ļ���
audioFiles = {'0_number.m4a', '1_number.m4a', '2_number.m4a', '3_number.m4a', '4_number.m4a', '5_number.m4a', '6_number.m4a', '7_number.m4a', '8_number.m4a', '9_number.m4a', 'sharp_symbol.m4a', 'star_symbol.m4a'};

% MP3��ʽ�Ĳ�����һ��Ϊ44100
fs = 44100;

% ��ƥ��Ĵ�
answers = {'0', '1', '2', '3', '4', '5', '6', '7', '8', '9', '#', '*'};

% 8�ֲ�ͬ��Ƶ��
dtmf = [697, 770, 852, 941, 1209, 1336, 1477, 1633]; 

% �����ϵ�16��˫��Ƶ��ͬ�İ���
keys = ['1','2','3','A';'4','5','6','B';'7','8','9','C';'*','0','#','D'];

% ʹ��fft�������12���ź�
for signal = 1:12
    % ��ӡ�������Ĵ�
    disp('the true answer is ');
    disp(answers(signal));
    % audioread������ȡ�����е���Ƶ�ļ�
    % audioSignalData����ȡ��������Ƶ�ź�����
    % fs����Ƶ������
    [audioSignalData, fs] = audioread(audioFiles{signal});
    % ��ʼ��ʱ
    tic;
    % ���÷��������ó����
    fftAnswer = FFTPredict(audioSignalData, fs, dtmf, keys);
    % ֹͣ��ʱ
    toc;
    % ��ӡ�����
    disp('the fft answer is ');
    disp(fftAnswer);
end

% ʹ��Goertzel�������12���ź�
for signal = 1:12
    % ��ӡ�������Ĵ�
    disp('the true answer is ');
    disp(answers(signal));
    % audioread������ȡ�����е���Ƶ�ļ�
    % audioSignalData����ȡ��������Ƶ�ź�����
    % fs����Ƶ������
    [audioSignalData, fs] = audioread(audioFiles{signal});
    % ��ʼ��ʱ
    tic;
    % ���÷��������ó����
    GoertzelAnswer = GoertzelPredict(audioSignalData, fs, dtmf, keys);
    % ֹͣ��ʱ
    toc;
    % ��ӡ�����
    disp('the Goertzel answer is ');
    disp(GoertzelAnswer);
end


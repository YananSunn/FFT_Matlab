
% ���ó�ʼ����
hConst = 1000;
nConst = 100;
MAX = 20000;

% ��Ϊ���ַ����������������
originTime = zeros(1, MAX);
circleTime = zeros(1, MAX);
overlapSaveTime = zeros(1, MAX);
overlapAddTime = zeros(1, MAX);

% ԭʼ����
for length = 1000:100:MAX
    % �����������
    l = rand([1, length]);
    h = rand([1, hConst]);
    % ��ü��㿪ʼ��ʱ��
    startTime = clock;
    % ���ü������ĺ���
    originAns = OriginConvolution(l, h);
    % ��ü��������ʱ��
    stopTime = clock;
    % ����������ʱ
    originTime(length) = etime(stopTime, startTime); 
end

% Բ���
for length = 1000:100:MAX
    % �����������
    l = rand([1, length]);
    h = rand([1, hConst]);
    % ��ü��㿪ʼ��ʱ��
    startTime = clock;
    % ���ü������ĺ���
    circleAns = CircleConvolution(l, h);
    % ��ü��������ʱ��
    stopTime = clock;
    % ����������ʱ
    circleTime(length) = etime(stopTime, startTime); 
end

 % OverlapSave
for length = 1000:100:MAX
    % �����������
    l = rand([1, length]);
    h = rand([1, hConst]);
    % ��ü��㿪ʼ��ʱ��
    startTime = clock;
    % ���ü������ĺ���
    overlapSaveAns = OverlapSaveConvolution(l, h, nConst + hConst);
    % ��ü��������ʱ��
    stopTime = clock;
    % ����������ʱ
    overlapSaveTime(length) = etime(stopTime, startTime); 
end

% OverlapAdd
for length = 1000:100:MAX
    % �����������
    l = rand([1, length]);
    h = rand([1, hConst]);
    % ��ü��㿪ʼ��ʱ��
    startTime = clock;
    % ���ü������ĺ���
    overlapAddAns = OverlapAddConvolution(l, h, nConst);
    % ��ü��������ʱ��
    stopTime = clock;
    % ����������ʱ
    overlapAddTime(length) = etime(stopTime, startTime); 
end

% ����ͼ��
l = 1:MAX;
% ע�⣺plot�÷� plot(x, y) x���� y���� ��ѡ�������������͵�����ɫ
% - ʵ��   : ����   -. �����   -- ������
% . Բ��   + �Ӻ�   * �Ǻ�   x x��   o СԲ
% y��   r��   g��   b��   w��   k��   m��   c��
plot(l, originTime,'-y', l, circleTime,'-r', l, overlapSaveTime, '-g', l, overlapAddTime, '-k');
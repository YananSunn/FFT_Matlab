
% 设置初始参数
hConst = 1000;
nConst = 100;
MAX = 20000;

% 将为四种方法计数的数组清空
originTime = zeros(1, MAX);
circleTime = zeros(1, MAX);
overlapSaveTime = zeros(1, MAX);
overlapAddTime = zeros(1, MAX);

% 原始定义
for length = 1000:100:MAX
    % 生成随机序列
    l = rand([1, length]);
    h = rand([1, hConst]);
    % 获得计算开始的时间
    startTime = clock;
    % 调用计算卷积的函数
    originAns = OriginConvolution(l, h);
    % 获得计算结束的时间
    stopTime = clock;
    % 计算整体用时
    originTime(length) = etime(stopTime, startTime); 
end

% 圆卷积
for length = 1000:100:MAX
    % 生成随机序列
    l = rand([1, length]);
    h = rand([1, hConst]);
    % 获得计算开始的时间
    startTime = clock;
    % 调用计算卷积的函数
    circleAns = CircleConvolution(l, h);
    % 获得计算结束的时间
    stopTime = clock;
    % 计算整体用时
    circleTime(length) = etime(stopTime, startTime); 
end

 % OverlapSave
for length = 1000:100:MAX
    % 生成随机序列
    l = rand([1, length]);
    h = rand([1, hConst]);
    % 获得计算开始的时间
    startTime = clock;
    % 调用计算卷积的函数
    overlapSaveAns = OverlapSaveConvolution(l, h, nConst + hConst);
    % 获得计算结束的时间
    stopTime = clock;
    % 计算整体用时
    overlapSaveTime(length) = etime(stopTime, startTime); 
end

% OverlapAdd
for length = 1000:100:MAX
    % 生成随机序列
    l = rand([1, length]);
    h = rand([1, hConst]);
    % 获得计算开始的时间
    startTime = clock;
    % 调用计算卷积的函数
    overlapAddAns = OverlapAddConvolution(l, h, nConst);
    % 获得计算结束的时间
    stopTime = clock;
    % 计算整体用时
    overlapAddTime(length) = etime(stopTime, startTime); 
end

% 绘制图像
l = 1:MAX;
% 注意：plot用法 plot(x, y) x横轴 y纵轴 可选第三项设置线型点型颜色
% - 实线   : 点线   -. 虚点线   -- 波折线
% . 圆点   + 加号   * 星号   x x形   o 小圆
% y黄   r红   g绿   b蓝   w白   k黑   m紫   c青
plot(l, originTime,'-y', l, circleTime,'-r', l, overlapSaveTime, '-g', l, overlapAddTime, '-k');
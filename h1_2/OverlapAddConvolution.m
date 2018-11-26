% nConst是分段小序列的长度
function res = OverlapAddConvolution(l, h, nConst)
    % 序列l的长度
    lLength = length(l);
    % 序列h的长度
    hLength = length(h);
    % 处理分段序列的长度小于h序列的长度的情况
    if nConst < hLength
        nConst = hLength + 1;
    end
    % 每一分段段卷积结果的长度
    convLength = nConst + hLength - 1;
    % 上取整得到循环次数
    loopNum = ceil(lLength / nConst);
    % 将用于记录当前小段卷积的结果的数组清零
    lTemp = zeros(1, hLength - 1);
    l = [l, zeros(1, (loopNum + 1) * nConst - lLength)];
    % 将记录最终结果的数组清零
    res = zeros(1, (loopNum + 1) * nConst);
    
    for i = 0:loopNum
        % 计算出分段序列li的开始位置
        start = i * nConst + 1;
        % 使用圆卷积方法计算当前段的线卷积
        hTemp = ifft(fft(l(start : start + nConst - 1), convLength) .* fft(h, convLength));
        % 将重叠部分相加
        hTemp(1 : hLength - 1) = hTemp(1 : hLength - 1) + lTemp;
        % 将多出的部分存入lTemp中参与下一轮运算
        lTemp = hTemp(nConst + 1 : convLength);
        % 将本次计算结果存入结果数组中对应的位置
        res(start : start + nConst - 1) = hTemp(1 : nConst); 
    end
    res = res(1:lLength+hLength-1);
end
function sample = calsample(sampledata,FS)
temp_sample = resample(sampledata,1,FS/11025);
[m,n] = size(temp_sample);
if (n == 2)
    sample = temp_sample(:,1);
else
    sample = temp_sample;
end
end
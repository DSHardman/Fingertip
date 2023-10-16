AFFTs = getFFTs(find(presslocs(1:end-1)=='A'), keeps);
save("AFFTs.mat", "AFFTs");
BFFTs = getFFTs(find(presslocs(1:end-1)=='B'), keeps);
save("BFFTs.mat", "BFFTs");
CFFTs = getFFTs(find(presslocs(1:end-1)=='C'), keeps);
save("CFFTs.mat", "CFFTs");
DFFTs = getFFTs(find(presslocs(1:end-1)=='D'), keeps);
save("DFFTs.mat", "DFFTs");
EFFTs = getFFTs(find(presslocs(1:end-1)=='E'), keeps);
save("EFFTs.mat", "EFFTs");
FFFTs = getFFTs(find(presslocs(1:end-1)=='F'), keeps);
save("FFFTs.mat", "FFFTs");

function FFTs = getFFTs(indices, keeps)
    FFTs = zeros([928, 1]);
    for i = 1:928
        i
        fftsum = 0;
        for j = 1:length(indices)
            [~, ~, ~, responses, ~] = getattempt(indices(j));
            response = responses(1:55, keeps(i));
            response = normalize(response);
            singlefft = real(fft(response));
            fftsum = fftsum + singlefft(2);
        end
        FFTs(i) = fftsum/length(indices);
    end
end
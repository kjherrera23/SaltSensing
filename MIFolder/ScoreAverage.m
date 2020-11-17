function MeanScore = ScoreAverage(Score,nthresh)
    NScore1 = sum(Score~= 0,4);
    NScore1(NScore1 < nthresh) = 0;
    MeanScore = sum(Score,4)./NScore1;
    MeanScore(NScore1 == 0) = 0;
end
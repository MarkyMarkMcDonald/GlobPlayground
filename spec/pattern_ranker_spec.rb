require_relative '../lib/pattern_ranker/pattern_ranker'

describe PatternRanker do
  describe '.rank' do
    it 'ranks patterns' do

      pattern1 = '*twitch*'
      pattern2 = '*'
      pattern3 = '*twitch.tv/chat*'
      pattern4 = '*twitch.*chat'

      rankings = PatternRanker.rank pattern1, pattern2, pattern3, pattern4

      expect(rankings).to eq([pattern3, pattern4, pattern1, pattern2])
    end
  end
end

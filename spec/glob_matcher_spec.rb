require_relative '../lib/pattern_ranker/glob_matcher'

describe GlobMatcher do
  describe '.matches?' do
    it 'matches valid ant matchers' do
      expect(GlobMatcher.matches?('http://www.twitch.tv', '*.twitch.tv*')).to be_truthy
      expect(GlobMatcher.matches?('http://www.google.com/search?q=yolokitten', '*.google.com/search*')).to be_truthy
    end

    it 'does not match invalid ant matchers' do
      expect(GlobMatcher.matches?('http://www.tch.tv', '*.twitch.tv*')).to be_falsey
      expect(GlobMatcher.matches?('', '*.twitch.tv*')).to be_falsey
    end

    it 'matches valid regular expressions' do
      expect(GlobMatcher.matches?('sdsdsdsdsd##twitch##jkldsfjlksdjfslkdjf', '/.*twitch.*/')).to be_truthy
      expect(GlobMatcher.matches?('twitch', '/.*twitch.*/')).to be_truthy
    end

    it 'does not matches invalid regular expressions' do
      expect(GlobMatcher.matches?('http://www.tch.tv', '/.*twitch.*/')).to be_falsey
      expect(GlobMatcher.matches?('', '/.*twitch.*/')).to be_falsey
    end
  end
end

class PatternRanker
  def self.rank(*patterns)
    patterns.sort do |pattern1, pattern2|
      pattern2.gsub('*', '').length <=> pattern1.gsub('*', '').length
    end
  end
end

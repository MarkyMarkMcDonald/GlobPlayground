class GlobMatcher
  def self.matches?(content, pattern)
    if pattern.start_with? '/' and pattern.end_with? '/'
      content.match pattern[1..-2]
    else
      content.match glob_to_regexp(pattern)
    end
  end

  private
  def self.glob_to_regexp(pattern)
    tokenized_pattern = pattern.gsub '*', '%%%%%%%%%%'
    Regexp.escape(tokenized_pattern).gsub '%%%%%%%%%%', '.*'
  end
end

class SearchLanguage

  def initialize(data, search)
    @data = data
    @search = search
  end

  def execute
    result = []

    @data.each do |d|

      check = []
      val = d.values.join(' ').delete(',')

      @search.delete('\"').split(" ").each do |s|
        match_val = val =~ /\b(?:#{s})\b/i
        check << match_val
        break if match_val.nil?
      end

      res = d["Name"] unless check.include?(nil)
      result << res
    end
    result.uniq.compact
  end
end

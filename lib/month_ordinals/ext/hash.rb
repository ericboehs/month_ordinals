class ::Hash
  def deep_array_merge second
    merger = proc do |key, v1, v2|
      if Hash === v1 && Hash === v2
        v1.merge v2, &merger
      elsif v1.is_a?(Array) && v2.is_a?(Array)
        v1 + v2
      end
    end

    self.merge second, &merger
  end
end

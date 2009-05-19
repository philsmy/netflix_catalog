module NetFlix
  class Actor < Valuable
    has_value :id
    has_value :name
    has_value :url

    def to_json
      attributes.to_json
    end

    def self.from_json(data)
      self.new(JSON.parse(data))
    end

    def to_s
      name || "unknown actor [#{id}]"
    end
  end
end
module NetFlix
  class Title < Valuable

    has_value :id
    has_value :url
    has_value :release_year
    has_collection :genres
    has_collection :actors
    has_collection :directors
    has_value :title
    has_value :web_page
    has_collection :delivery_formats
    has_value :average_rating

    def to_json
      attributes.to_json
    end

    def self.from_json(data)
      self.new(JSON.parse(data))
    end

    def to_s
      title || 'unknown title'
    end

    class << self

      def complete_list
        data = NetFlix::API::Catalog::Titles.list
        TitleBuilder.from_xml(data)
      end

      def search(params)
        if params[:term]
          params[:term] = NetFlix::Request.encode(params[:term])
        end
        data = NetFlix::API::Catalog::Titles.search(params)
        TitleBuilder.from_xml(data)
      end

    end
  end # class Title
end # module NetFlix


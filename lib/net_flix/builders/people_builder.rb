class PeopleBuilder

  def self.from_xml(xml)
    return [] unless xml

    nxml = Nokogiri.XML(xml)
    
    actors(nxml).map do |data|
      PeopleBuilder.new(data).actor
    end
  end

  def self.from_movie(movie, type = :cast)
    case type
    when :cast
      cast_link_node = movie.search('link[@rel="http://schemas.netflix.com/catalog/people.cast"]').first
      cast_link = cast_link_node['href'] if cast_link_node
    when :directors
      cast_link_node = movie.search('link[@rel="http://schemas.netflix.com/catalog/people.directors"]').first
      cast_link = cast_link_node['href'] if cast_link_node
    end
    if cast_link.nil?
      []
    else
      request = NetFlix::Request.new(:url => cast_link)
      response = request.send
      from_xml(response)
    end
  end

  def self.actors(noko_xml)
    noko_xml.xpath('//person')
  end

  def initialize(data)
    @data = data
    @actor = NetFlix::Actor.new

    set_id
    set_name
    set_url
  end

  def set_id
    node = @data.search('id').first
    if node and node.content[/[0-9]*$/]
      @actor.id = node.content[/[0-9]*$/]
    end
  end

  def set_url
    node = @data.search('id').first
    @actor.url = node.content if node
  end

  def set_name
    node = @data.search('name').first
    @actor.name = node.content if node
  end
  
  def actor
    @actor
  end
end

class Betvictor
  attr_reader :source

  def initialize
    @source = Parser.new( :json ).parse_from_url MAIN_SOURCE
  end

  def find name, id
    send( name.to_s.downcase.pluralize ).detect { |elm| elm[ "id" ] == id }
  end

  def sports
    source[ "sports" ]
  end

  def events sport_id
    sports[ sport_id.to_i ][ "events" ]
  end

  def outcomes sport_id, event_id
    events( sport_id )[ event_id.to_i ]
  end
end
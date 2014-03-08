class Betvictor
  attr_reader :source

  def initialize
    @source = Parser.new( :json ).parse_from_url MAIN_SOURCE
  end

  def find name, id, args = nil
    send( name.to_s.downcase.pluralize, args ).detect { |elm| elm[ "id" ] == id }
  end

  def sports args = nil
    source[ "sports" ]
  end

  def events args
    sport_id = args[0]
    find( :sports, sport_id.to_i )[ "events" ]
  end

  def outcomes args
    event_id = args[1]
    find( :events, event_id.to_i, args )[ "outcomes" ]
  end
end
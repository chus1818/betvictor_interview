class Betvictor
  attr_reader :source

  SORT_METHOD = proc { |elm| elm[ "pos" ] }

  def initialize
    @source = Parser.new( :json ).parse_from_url MAIN_SOURCE
  end

  def find name, id, args = nil
    send( name.to_s.downcase.pluralize, args ).detect { |elm| elm[ "id" ] == id }
  end

  def sports args = nil
    source[ "sports" ].sort_by &SORT_METHOD
  end

  def events args
    sport_id = args[0]
    find( :sports, sport_id.to_i )[ "events" ].sort_by &SORT_METHOD
  end

  def outcomes args
    event_id = args[1]
    find( :events, event_id.to_i, args )[ "outcomes" ].sort_by &SORT_METHOD
  end

end
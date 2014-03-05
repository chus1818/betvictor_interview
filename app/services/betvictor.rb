class Betvictor
  attr_reader

  def initialize
    @source = Parser.new( :json ).parse_from_url MAIN_SOURCE
  end

  def sports
    source["sports"]
  end

end
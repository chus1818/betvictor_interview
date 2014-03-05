Dir[ "#{Rails.root}/app/services/parser_related/*.rb" ].each { |file| require file }

class Parser
  def initialize format, options = {}
    @format = format
  end

  def parse_from_url url_string
    response = Net::HTTP.get url_string.to_uri
    "#{@format}_parse".classify.constantize.new response
  end
end
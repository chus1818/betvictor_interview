class JsonParse < Hash
  def initialize json
    begin
      merge! JSON.parse( json )
    rescue
      raise UnprocessableJsonError
    end
  end
end

UnprocessableJsonError = Class.new StandardError
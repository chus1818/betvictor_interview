class String
  def to_uri
    uri = URI( self )
    uri.scheme.in?( [ 'http', 'https' ] ) ? uri : ( raise URI::BadURIError )
  end
end
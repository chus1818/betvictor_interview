class BetvictorRecord
  extend BetvictorConnection
  
  attr_reader :record

  def initialize record
    @record = record
  end
end
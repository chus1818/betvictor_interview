class BetvictorRecord
  def self.all
    Betvictor.new.send pluralized_name_symbol
  end

  def self.find id
    Betvictor.new.find name_symbol, id
  end
end
class BetvictorRecord
  attr_reader :record

  def self.all
    retrieve_all_from_source.map { |record| new record }
  end

  def self.find id
    new retrieve_from_source id.to_i
  end

  def self.attr_readable *args
    args.each do |arg|
      define_method( arg ) { record[ arg.to_s ] }
    end
  end

  def self.first
    all.first
  end

  def self.last
    all.last
  end

  def initialize record
    @record = record
  end

protected

  def self.retrieve_from_source id
    Betvictor.new.find name_symbol, id
  end

  def self.retrieve_all_from_source
    Betvictor.new.send pluralized_name_symbol
  end
end
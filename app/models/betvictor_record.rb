class BetvictorRecord
  attr_reader :record

  def self.attr_readable *args
    args.each do |arg|
      define_method( arg ) { record[ arg.to_s ] }
    end
  end

  def self.all *args
    retrieve_all_from_source( args ).map { |record| new record }
  end

  def self.find id, *args
    new retrieve_from_source id.to_i, args
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

  def self.retrieve_from_source id, args
    Betvictor.new.find name_symbol, id, args
  end

  def self.retrieve_all_from_source args
    Betvictor.new.send pluralized_name_symbol, args
  end
end
module BetvictorConnection

  def attr_readable *args
    args.each do |arg|
      define_method( arg ) { record[ arg.to_s ] }
    end
  end

  def all *args
    retrieve_all_from_source( args ).map { |record| new record }
  end

  def find id, *args
    new retrieve_from_source id.to_i, args
  end

  def first
    all.first
  end

  def last
    all.last
  end

protected

  def retrieve_from_source id, args
    Betvictor.new.find name_symbol, id, args
  end

  def retrieve_all_from_source args
    Betvictor.new.send pluralized_name_symbol, args
  end

end
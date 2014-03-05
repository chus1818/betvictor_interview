class Class
  def name_symbol
    self.name.downcase.singularize.to_sym
  end

  def pluralized_name_symbol
    name_symbol.to_s.pluralize.to_sym
  end
end
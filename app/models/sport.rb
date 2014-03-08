class Sport < BetvictorRecord
  attr_readable :id, :title, :meetings, :is_virtual, :events

  def humanized_is_virtual
    # Must be extracted into a presenter
    is_virtual ? I18n.t( 'helpers.yes_helper' ) : I18n.t( 'helpers.no_helper' )
  end
end
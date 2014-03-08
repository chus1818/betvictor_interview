module ApplicationHelper
  def humanize_boolean bool
    bool ? I18n.t( 'helpers.yes_helper' ) : I18n.t( 'helpers.no_helper' )
  end
end

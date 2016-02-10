require 'calabash-cucumber/ibase'

class LocationSelectionPage < Calabash::IBase

  def trait
    "label {text BEGINSWITH 'Locations ('}"
  end

  def touch_filter_field
    touch("UISearchBarTextFieldLabel text:'Search'")
  end

  def check_if_location_is_in_list(arg1)
    check_element_exists("UITableViewLabel text:'" + arg1 + "'")
  end

  def check_if_location_is_not_in_list(arg1)
    check_element_does_not_exist("UITableViewLabel text:'" + arg1 + "'")
  end

end
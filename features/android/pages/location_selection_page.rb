class LocationChangePage < Calabash::ABase

  def trait
    "label {text BEGINSWITH 'Locations ('}"
  end

  def create_new_person_observation
  	open_bbs_creation_context
  	tap_observe_person
  end

  def check_if_location_is_in_list(location)
    check_element_exists("UITableViewLabel text:'"+location+"'")
  end

  def check_if_location_is_not_in_list(location)
    check_element_does_not_exist("UITableViewLabel text:'"+location+"'")
  end

  def press_on_a_search_field
    touch("UISearchBarTextFieldLabel text:'Search'")
  end
end
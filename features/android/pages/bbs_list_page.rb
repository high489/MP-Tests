class BbsListPage < Calabash::ABase

  def trait
    "label {text BEGINSWITH 'BBS ('}"
  end

  def create_new_person_observation
  	open_bbs_creation_context
  	tap_observe_person
  end
  def create_new_group_observation
  	open_bbs_creation_context
  	tap_observe_group
  end

  def open_bbs_creation_context
    touch("label index:10")
  end
  def tap_observe_person
    touch("label text:'Observe Person'")
  end
  def tap_observe_group
    touch("label text:'Observe Group'")
  end

end
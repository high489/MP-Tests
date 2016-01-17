require 'calabash-cucumber/ibase'

class BbsDetailsPage < Calabash::IBase

  def trait
    "* marked:'Observation Details"
  end

  # SETTERS
  def change_work_area(work_area)
    touch("label text:'Work Area'")
    touch("label text:'"+work_area+"'")
    check_element_exists("label text:'"+work_area+"'")
  end

  def set_reported_by_field_value(reporter_by_value)
    if reporter_by_value == 'Other'
      touch("UISegment marked:'Other'")
    elsif reporter_by_value == 'Observer'
      touch("UISegment marked:'Observer'")
    else
      raise NotFoundUiElementException, "Unsupportable value for field 'report data by' :"+ arg
    end
  end

  # CHECKS
  def check_if_observation_type_is_group
    check_element_exists("label text:'Observation Type'")
    check_element_exists("label text:'Group'")
  end
  def check_if_observation_type_is_peer_to_peer
    check_element_exists("label text:'Observation Type'")
    check_element_exists("label text:'Peer To Peer'")
  end

  def check_work_area(work_area)
    check_element_exists("label text:'Work Area'")
    check_element_exists("label text:'"+work_area+"'")
  end

  def check_if_data_is_reported_by_observer
    check_element_exists("UISegment marked:'Observer' isSelected:1")
    check_element_exists("UISegment marked:'Other' isSelected:0")
  end
  def check_if_data_is_reported_by_other
    check_element_exists("UISegment marked:'Other' isSelected:1")
    check_element_exists("UISegment marked:'Observer' isSelected:0")
  end

  def check_if_observer_type_is_enabled
    check_element_exists("UISegment marked:'User'")
    check_element_exists("UISegment marked:'Employee'")
    check_element_exists("label text:'Observer type'")
  end
  
  def check_if_observer_type_is_not_enabled
    #TODO: elements must not be visible, otherwise need to know hidden view ID
    check_element_does_not_exist("UISegment marked:'User'")
    check_element_does_not_exist("UISegment marked:'Employee'")
    check_element_does_not_exist("label text:'Observer type'")
  end

  def check_if_observer_type_is_user
    check_element_exists("UISegment marked:'User' isSelected:1")
    check_element_exists("UISegment marked:'Employee' isSelected:0")
  end

  def check_if_observer_type_is_employee
    check_element_exists("UISegment marked:'Employee' isSelected:1")
    check_element_exists("UISegment marked:'User' isSelected:0")
  end

  def check_observer(observer)
    check_element_exists("label text:'"+observer+"'")
  end

  def clear_observer
  end

  def set_observer
  end

  def check_shift(shift)
  end

  def change_shift(shift)
  end

  def check_comment(comment)
  end

  def change_comment(comment)
  end

end
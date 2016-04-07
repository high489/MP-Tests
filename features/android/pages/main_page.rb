require 'calabash-android/abase'

class MainPage < Calabash::ABase

  def trait
    "AppCompatCheckedTextView text:'Log Off'"
  end

  def open_bbs_module
    wait_for_elements_exist("AppCompatCheckedTextView text:'Behavioral Based Safety'", :timeout => 5)
    touch("AppCompatCheckedTextView text:'Behavioral Based Safety'")
  end


  def open_location_change_page
    wait_for_elements_exist("AppCompatCheckedTextView text:'Change Location'", :timeout => 5)
    touch("AppCompatCheckedTextView text:'Change Location'")
  end



end
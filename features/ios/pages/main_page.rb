require 'calabash-cucumber/ibase'

class MainPage < Calabash::IBase

  def trait
    "label text:'Calendar'"
  end

  def open_bbs_module
    wait_for_elements_exist("* text:'Behavioral Based Safety'", :timeout => 5)
    touch("* text:'Behavioral Based Safety'")
  end

end
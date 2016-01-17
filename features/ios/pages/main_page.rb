require 'calabash-cucumber/ibase'

class MainPage < Calabash::IBase

  def trait
    "* marked:'Log Off"
  end

  def open_bbs_module
    touch("* text:'Behavioral Based Safety'")
  end

end
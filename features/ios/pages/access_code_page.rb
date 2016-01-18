require 'calabash-cucumber/ibase'

class AccessCodePage < Calabash::IBase

  def trait
    "* text:'Access Code'"
  end

  def enter_access_code
    touch("button marked:'4'")
    touch("button marked:'1'")
    touch("button marked:'6'")
    touch("button marked:'6'")
    touch("button marked:'3'")
    touch("button marked:'9'")
    touch("button index:11")
  end

end
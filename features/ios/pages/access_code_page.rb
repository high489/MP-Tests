require 'calabash-cucumber/ibase'

class AccessCodePage < Calabash::IBase

  def trait
    "button marked:'1'"
    "button marked:'2'"
    "button marked:'3'"
    "button marked:'4'"
    "button marked:'5'"
    "button marked:'6'"
    "button marked:'7'"
    "button marked:'8'"
    "button marked:'9'"
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
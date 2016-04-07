require 'calabash-android/abase'

class AccessCodePage < Calabash::ABase

  def trait
    "* text:'Access Code'"
  end

  def enter_access_code
    touch("AppCompatButton id:'num_2'")
    touch("AppCompatButton id:'num_6'")
    touch("AppCompatButton id:'num_3'")
    touch("AppCompatButton id:'num_4'")
    touch("AppCompatButton id:'num_4'")
    touch("AppCompatButton id:'num_7'")
    touch("AppCompatButton id:'button_ok'")
  end

end
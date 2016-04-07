require 'calabash-android/abase'

class LoginPage < Calabash::ABase

  def trait
    "AppCompatButton id:'LoginFragment_Button'"
  end

  def login(user,pass)
    wait_for_elements_exist("TextInputLayout id:'LoginFragment_UsernameLayout'", :timeout => 5)
    touch("TextInputLayout id:'LoginFragment_UsernameLayout'")
    wait_for_keyboard()
#    if element_exists("button isEnabled:1 index:1")
#        touch("button isEnabled:1 index:1")
#    end
    keyboard_enter_text(user)
    hide_soft_keyboard()
    touch("TextInputLayout id:'LoginFragment_PasswordLayout'")
    wait_for_keyboard()
    keyboard_enter_text(pass)
    hide_soft_keyboard()
    touch("AppCompatButton id:'LoginFragment_Button'")
  end

  def wait_for_failed_login(invalidlogin)
  	wait_for_elements_exist("label text:'" +invalidlogin+ " is invalid'", :timeout => 5)
  end

end
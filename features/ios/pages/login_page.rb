class LoginPage < Calabash::IBase

  def trait
    "button marked:'LOG IN'"
  end

  def login(user,pass)
    wait_for_elements_exist("label text:'Username'", :timeout => 5)
    touch("* text:'Username'")
    wait_for_keyboard()
    if element_exists("button isEnabled:1 index:1")
        touch("button isEnabled:1 index:1")
    end
    keyboard_enter_text(user)
    done
    touch("* text:'Password'")
    wait_for_keyboard()
    keyboard_enter_text(pass)
    done
    touch("button marked:'LOG IN'")
  end

  def wait_for_failed_login(invalidlogin)
  	wait_for_elements_exist("label text:'" +invalidlogin+ " is invalid'", :timeout => 5)
  end

end
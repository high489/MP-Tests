class MainPage < Calabash::IBase

  def trait
    "label text:'Calendar'"
  end

  def open_bbs_module
    wait_for_elements_exist("* text:'Behavioral Based Safety'", :timeout => 5)
    touch("* text:'Behavioral Based Safety'")
  end


  def open_location_change_page
    wait_for_elements_exist("label text:'Change Location'", :timeout => 5)
    touch("label text:'Change Location'")
  end



end
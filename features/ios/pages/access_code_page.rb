class AccessCodePage < Calabash::IBase

  def trait
    "* text:'Access Code'"
  end

  def enter_access_code
    touch("button marked:'1'")
    touch("button marked:'0'")
    touch("button marked:'7'")
    touch("button marked:'1'")
    touch("button marked:'7'")
    touch("button marked:'3'")
    touch("button index:11")
  end

end
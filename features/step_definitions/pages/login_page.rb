Given /^I am on the login screen$/ do
  if not element_exists("button label text:'LOG IN'")
      touch("button marked:'4'")
      touch("button marked:'1'")
      touch("button marked:'6'")
      touch("button marked:'6'")
      touch("button marked:'3'")
      touch("button marked:'9'")
      touch("button index:11")
  end
end


When (/^I try to login as (.*) with password (.*)$/) do |arg1, arg2|
    wait_for_elements_exist("label text:'Username'", :timeout => 3)
    tap("Username")
    wait_for_keyboard()
    keyboard_enter_text("#{arg1}")
    tap("Password")
    tap("Password")
    wait_for_keyboard()
    keyboard_enter_text("#{arg2}")
    tap("Password")
    touch("button label text:'LOG IN'")
end

Then (/^I see invalid ([^\"]*) login message window$/) do |invalidlogin|
    wait_for_elements_exist("label text:'#{invalidlogin} is invalid'", :timeout => 10)
end
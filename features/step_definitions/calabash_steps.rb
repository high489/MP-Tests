if ENV['PLATFORM'] == 'ios'
  require 'calabash-cucumber/cucumber'
elsif ENV['PLATFORM'] == 'android'
  require 'calabash-android/cucumber'
end

When (/^I type text '(.*)'$/) do |arg1|
	keyboard_enter_text(arg1)
end

When (/^I erase one char$/) do
	keyboard_enter_char("\b")
end
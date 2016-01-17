Given /^I am on the login screen$/ do
  if not element_exists("button label text:'LOG IN'")
    @current_page = page(AccessCodePage).await(timeout: 30)
    current_page.enter_access_code
  end
  @current_page = page(LoginPage).await(timeout: 30)
end


When (/^I try to login as '(.*)' with password '(.*)'$/) do |arg1, arg2|
    @current_page.login(arg1,arg2)
end

When (/^I try to login as valid user$/) do
    @username = VALID_LOGIN[:username]
    @password = VALID_LOGIN[:password]
    macro ("I try to login as '" + @username + "' with password '" + @password + "'")
end

Then (/^I see invalid '([^\"]*)' login message window$/) do |invalidlogin|
    @current_page.wait_for_failed_login(invalidlogin)
end

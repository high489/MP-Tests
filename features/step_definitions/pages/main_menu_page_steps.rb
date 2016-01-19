Given /^I am logged in$/ do
    macro ("I am on the login screen")
    macro ("I try to login as valid user")
    macro ("I am on main app page")
end

Then (/^I am on main app page$/) do
	@main_page = page(MainPage).await(timeout: 10)
end
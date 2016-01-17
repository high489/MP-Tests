Then (/^I am on main app page$/) do
    wait_for_elements_exist("label text:'Log Off'", :timeout => 4)
end
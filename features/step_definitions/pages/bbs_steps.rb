When (/^I move to BBS list page$/) do
    @main_page = page(MainPage).await(timeout: 30)
    @main_page.open_bbs_module
    @bbs_list_page = page(BbsListPage).await(timeout: 30)
end


When (/^I crete new person observation$/) do
    @bbs_list_page.create_new_person_observation
    @bbs_edit_page =  page(BbsDetailsPage).await(timeout: 30)
end

When (/^I crete new group observation$/) do
    @bbs_list_page.create_new_group_observation
    @bbs_edit_page =  page(BbsDetailsPage).await(timeout: 30)
end

Then (/^I see user '(.*)' as observer$/) do |arg1|
	@bbs_edit_page.check_if_data_is_reported_by_observer
	@bbs_edit_page.check_if_observer_type_is_enabled
	@bbs_edit_page.check_if_observer_type_is_user
    @bbs_edit_page.check_observer(arg1)
end

Then (/^I don't see observer type buttons$/) do
	@bbs_edit_page.check_if_data_is_reported_by_other
	@bbs_edit_page.check_if_observer_type_is_not_enabled
end

Then (/^I see current user as observer$/) do
	@current_user_full_name = VALID_LOGIN[:displayname]
    macro ("I see user '" + @current_user_full_name + "' as observer")
end

When (/^I change 'report data by' value to '(.*)'$/) do |arg1|
	@bbs_edit_page.set_reported_by_field_value(arg1)
end


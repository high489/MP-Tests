When (/^I move to location selection page$/) do
    @main_page = page(MainPage).await(timeout: 30)
    @main_page.open_location_selection_page
    @location_selection_page = page(LocationSelectionPage).await(timeout: 30)
end

When (/^I want to type in filter field$/) do
	@location_selection_page.touch_filter_field
end

Then (/^I see '(.*)' in location list$/) do |arg1|
	@location_selection_page.check_if_location_is_in_list(arg1)
end

Then (/^I don't see '(.*)' in location list$/) do |arg1|
	@location_selection_page.check_if_location_is_not_in_list(arg1)
end
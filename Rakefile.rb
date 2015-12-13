@predefined_ios_project_dir_absolute_path = '/Users/admin/Documents/MP-A3/MobilePro.xcodeproj'
@predefined_ios_build_dir_absolute_path = '/Users/admin/Documents/MP-Tests/apps'
@predefined_ios_target_name = 'MobilePro-cal'

@predefined_ios_udid = 'FEBA4F52-3517-4B08-A63C-30DA5B2B77E4'

@predefined_screenshot_absolute_path = '/Users/admin/Documents/MP-Tests/report/screenshots/'
@predefined_html_report_file_absolute_path = '/Users/admin/Documents/MP-Tests/report/myreport.html'

desc 'Build a "calabashed" version of the app'
task :build_ios_simulator_app do
  project_dir = ENV.has_key?('TEST_IOS_PROJECT_DIR') ? ENV['TEST_IOS_PROJECT_DIR'] : @predefined_ios_project_dir_absolute_path
  build_dir = ENV.has_key?('TEST_IOS_BUILD_DIR') ? ENV['TEST_IOS_BUILD_DIR'] : @predefined_ios_build_dir_absolute_path
  target_name = ENV.has_key?('TEST_IOS_TARGET_NAME') ? ENV['TEST_IOS_TARGET_NAME'] : @predefined_ios_target_name
  build_ios_app = <<COMMAND

xcrun xcodebuild \
-sdk iphonesimulator \
-project '#{project_dir}' \
-target '#{target_name}' \
  CONFIGURATION_BUILD_DIR='#{build_dir}' \
  clean build
COMMAND

  sh build_ios_app
end

desc 'Run all the calabash/cucumber acceptance tests on the simulator.'
task :test_ios_simulator do
  app_name_with_path = @predefined_ios_build_dir_absolute_path + '/' + @predefined_ios_target_name + '.app'

  current_app_file = ENV.has_key?('TEST_IOS_APP_WITH_PATH') ? ENV['TEST_IOS_APP_WITH_PATH'] : app_name_with_path
  simulator_udid = ENV.has_key?('TEST_IOS_UDID') ? ENV['TEST_IOS_UDID'] : @predefined_ios_udid

  report_file = ENV.has_key?('TEST_REPORT_FILE_WITH_PATH') ? ENV['TEST_REPORT_FILE_WITH_PATH'] : @predefined_html_report_file_absolute_path
  screenshot_dir = ENV.has_key?('TEST_SCREENSHOT_DIR') ? ENV['TEST_SCREENSHOT_DIR'] : @predefined_screenshot_absolute_path

  run_ios_tests = <<COMMAND
DEVICE_TARGET='#{simulator_udid}' \
APP_BUNDLE_PATH='#{current_app_file}' \
SCREENSHOT_PATH='#{screenshot_dir}' \
cucumber \
--format html \
-o '#{report_file}'
COMMAND

  sh run_ios_tests
end


desc 'Run all the calabash/cucumber acceptance tests on the simulator.'
task :build_and_test_on_ios_simulator => [:build_ios_simulator_app, :test_ios_simulator]do
end
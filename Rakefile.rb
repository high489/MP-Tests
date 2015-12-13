require 'fileutils'

# TEST_IOS_PROJECT
@predefined_ios_project_dir_absolute_path = '/Users/admin/Documents/MP-A3/MobilePro.xcodeproj'
# TEST_IOS_TARGET_NAME
@predefined_ios_target_name = 'MobilePro-cal'

# TEST_UTILS_APP_FOLDER
@predefined_ios_build_dir_absolute_path = '/Users/admin/Documents/MP-Tests/apps'

# TEST_IOS_UDID
@predefined_ios_udid = 'FEBA4F52-3517-4B08-A63C-30DA5B2B77E4'

# TEST_UTILS_SCREENSHOT_DIR
@predefined_screenshot_absolute_path = '/Users/admin/Documents/MP-Tests/report/screenshots/'
# TEST_UTILS_REPORT_DIR
@predefined_html_report_absolute_path = '/Users/admin/Documents/MP-Tests/report/'
# TEST_UTILS_REPORT_FILE_NAME
@predefined_html_report_file_name = 'report.html'


desc 'Build a "calabashed" version of the app'
task :build_ios_simulator_app do
  project_dir = ENV.has_key?('TEST_IOS_PROJECT') ? ENV['TEST_IOS_PROJECT'] : @predefined_ios_project_dir_absolute_path
  build_dir = ENV.has_key?('TEST_UTILS_APP_FOLDER') ? ENV['TEST_UTILS_APP_FOLDER'] : @predefined_ios_build_dir_absolute_path
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
task :test_on_ios_simulator do
	# App file with absolute path
  build_dir = ENV.has_key?('TEST_UTILS_APP_FOLDER') ? ENV['TEST_UTILS_APP_FOLDER'] : @predefined_ios_build_dir_absolute_path
  target_name = ENV.has_key?('TEST_IOS_TARGET_NAME') ? ENV['TEST_IOS_TARGET_NAME'] : @predefined_ios_target_name
  app_name_with_path = build_dir + '/' + target_name + '.app'

  simulator_udid = ENV.has_key?('TEST_IOS_UDID') ? ENV['TEST_IOS_UDID'] : @predefined_ios_udid

  report_dir_absolute_path = ENV.has_key?('TEST_UTILS_REPORT_DIR') ? ENV['TEST_UTILS_REPORT_DIR'] : @predefined_html_report_absolute_path
  report_file_name = ENV.has_key?('TEST_UTILS_REPORT_FILE_NAME') ? ENV['TEST_UTILS_REPORT_FILE_NAME'] : @predefined_html_report_file_name
  report_file_absolute_path = report_dir_absolute_path + '/' + report_file_name
  screenshot_dir_absolute_path = ENV.has_key?('TEST_UTILS_SCREENSHOT_DIR') ? ENV['TEST_UTILS_SCREENSHOT_DIR'] : @predefined_screenshot_absolute_path

  # Create folders for report and screenshots
  FileUtils.mkdir_p(report_dir_absolute_path)
  FileUtils.mkdir_p(screenshot_dir_absolute_path)

  run_ios_tests = <<COMMAND
DEVICE_TARGET='#{simulator_udid}' \
APP_BUNDLE_PATH='#{app_name_with_path}' \
SCREENSHOT_PATH='#{screenshot_dir_absolute_path}' \
cucumber \
--format html \
-o '#{report_file_absolute_path}'
COMMAND

  sh run_ios_tests
end


desc 'Run all the calabash/cucumber acceptance tests on the simulator.'
task :build_and_test_on_ios_simulator => [:build_ios_simulator_app, :test_on_ios_simulator]do
end
# encoding: UTF-8
require 'cucumber/rake/task'
require 'cucumber'
require 'rubygems'


#Run cucumber tests
Cucumber::Rake::Task.new :features do |t|
 # settings_file = Dir.pwd + '/config/cucumber.yml'
  settings_file = 'config/cucumber.yml'
  configs = YAML.load_file settings_file

  Encoding.default_internal = Encoding::UTF_8
  Encoding.default_external = Encoding::UTF_8

  # App file with absolute path
  ios_target = ENV.has_key?('TEST_IOS_TARGET_NAME') ? ENV['TEST_IOS_TARGET_NAME'] : configs['predefined_ios_target_name']
  ios_app_dir = ENV.has_key?('predefined_ios_build_dir_absolute_path') ? ENV['predefined_ios_build_dir_absolute_path'] : configs['predefined_ios_build_dir_absolute_path']
  app_name_with_path = ios_app_dir + '/' + ios_target + '-cal.app'

  # Get UDID
  udid = ENV.has_key?('TEST_IOS_UDID') ? ENV['TEST_IOS_UDID'] : configs['ios_udid']

  # Create folders for report and screenshots
  report_dir = ENV.has_key?('TEST_UTILS_REPORT_DIR') ? ENV['TEST_UTILS_REPORT_DIR'] : configs['report_dir_absolute_path']
  screenshot_dir = ENV.has_key?('TEST_UTILS_SCREENSHOT_DIR') ? ENV['TEST_UTILS_SCREENSHOT_DIR'] : configs['screenshot_dir_absolute_path']

  FileUtils.rmtree(screenshot_dir)
  FileUtils.rmtree(report_dir)
  FileUtils.mkdir_p(report_dir)
  FileUtils.mkdir_p(screenshot_dir)

    t.cucumber_opts = [
                      "features/",
                      "--format progress",
                      "--format html -o #{report_dir}/tests_result.html",
                      "DEVICE_TARGET='#{udid}' ",
                      "APP_BUNDLE_PATH='#{app_name_with_path}' ",
                      "SCREENSHOT_PATH='#{screenshot_dir}' "
                       ]
    t.fork=true
end

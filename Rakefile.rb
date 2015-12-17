# encoding: UTF-8
require 'cucumber/rake/task'
require 'cucumber'
require 'rubygems'


#Run cucumber tests
Cucumber::Rake::Task.new :features do |t|
 # settings_file = Dir.pwd + '/config/cucumber.yml'
  settings_file = 'config/cucumber.yml'
  configs = YAML.load_file settings_file

    # App file with absolute path
  app_name_with_path = configs['predefined_ios_build_dir_absolute_path'] + '/' + configs['predefined_ios_target_name'] + '-cal.app'

  Encoding.default_internal = Encoding::UTF_8
  Encoding.default_external = Encoding::UTF_8

  # Create folders for report and screenshots
  report_dir = ENV.has_key?('TEST_UTILS_REPORT_DIR') ? ENV['TEST_UTILS_REPORT_DIR'] : configs['report_dir_absolute_path']
  screenshot_dir = ENV.has_key?('TEST_UTILS_SCREENSHOT_DIR') ? ENV['TEST_UTILS_SCREENSHOT_DIR'] : configs['screenshot_dir_absolute_path']
  FileUtils.mkdir_p(report_dir)
  FileUtils.mkdir_p(screenshot_dir)

    t.cucumber_opts = [
                      "features/",
                      "--format progress",
                      "--format html -o #{configs['report_dir_absolute_path']}/tests_result.html",
                      "DEVICE_TARGET='#{configs['ios_udid']}' ",
                      "APP_BUNDLE_PATH='#{app_name_with_path}' ",
                      "SCREENSHOT_PATH='#{configs['screenshot_dir_absolute_path']}' "
                       ]
    t.fork=true
end

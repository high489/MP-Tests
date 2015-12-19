# encoding: UTF-8
require 'cucumber/rake/task'
require 'cucumber'
require 'rubygems'


def set_config_variables
  settings_file = 'config/cucumber.yml'
  configs = YAML.load_file settings_file

  @udid = ENV.has_key?('TEST_IOS_UDID') ? ENV['TEST_IOS_UDID'] : configs['ios_udid']
  @utils_app_dir = ENV.has_key?('TEST_UTILS_APP_FOLDER') ? ENV['TEST_UTILS_APP_FOLDER'] : configs['predefined_ios_app_dir_absolute_path']
  @target_name = ENV.has_key?('TEST_IOS_TARGET_NAME') ? ENV['TEST_IOS_TARGET_NAME'] : configs['predefined_ios_target_name']
  @app_name = @target_name + '-cal'
  @screenshot_dir = "./screenshots/"
end


#Run cucumber tests
Cucumber::Rake::Task.new :run_ios_tests do |t|
  Encoding.default_internal = Encoding::UTF_8
  Encoding.default_external = Encoding::UTF_8

  # App file with absolute path
  app_name_with_path = @utils_app_dir + '/' + @app_name

  FileUtils.rmtree(screenshot_dir)
  FileUtils.mkdir_p(screenshot_dir)

    t.cucumber_opts = [
                      "features/",
                      "--format progress",
                      "--format html -o ./report.html",
                      "DEVICE_TARGET='#{@udid}' ",
                      "APP_BUNDLE_PATH='#{app_name_with_path}' ",
                      "SCREENSHOT_PATH='#{@screenshot_dir}' "
                       ]
    t.fork=true
end

# encoding: UTF-8
require 'cucumber/rake/task'
require 'cucumber'
require 'rubygems'


def set_config_variables
  settings_file = 'config/cucumber.yml'
  configs = YAML.load_file settings_file

  @udid = ENV.has_key?('TEST_IOS_UDID') ? ENV['TEST_IOS_UDID'] : configs['ios_udid']
  @utils_app_dir = ENV.has_key?('TEST_UTILS_APP_DIR') ? ENV['TEST_UTILS_APP_DIR'] : configs['predefined_ios_app_dir_absolute_path']
  @target_name = ENV.has_key?('TEST_IOS_TARGET_NAME') ? ENV['TEST_IOS_TARGET_NAME'] : configs['predefined_ios_target_name']
  @app_name = @target_name + '-cal.app'
  @screenshot_dir = "./screenshots/"
end


#Run ios tests
Cucumber::Rake::Task.new :run_ios_tests do |t|
  Encoding.default_internal = Encoding::UTF_8
  Encoding.default_external = Encoding::UTF_8

  set_config_variables
  # App file with absolute path
  app_name_with_path = @utils_app_dir + '/' + @app_name

  FileUtils.rmtree(@screenshot_dir)
  FileUtils.mkdir_p(@screenshot_dir)

    t.cucumber_opts = [
                      "features/",
                      "--tags @temp",
                      "--format progress",
                      "--format html -o ./report.html",
                      "DEVICE_TARGET='#{@udid}' ",
                      "APP_BUNDLE_PATH='#{app_name_with_path}' ",
                      "SCREENSHOT_PATH='#{@screenshot_dir}' "
                       ]
    t.fork=true
end

#Run android tests
Cucumber::Rake::Task.new :run_android_tests do |t|
  Encoding.default_internal = Encoding::UTF_8
  Encoding.default_external = Encoding::UTF_8

  FileUtils.rmtree(@screenshot_dir)
  FileUtils.mkdir_p(@screenshot_dir)

    t.cucumber_opts = [
                      "features/",
                      "--tags @temp",
                      "--format progress",
                      "--format html -o ./report.html",
                      "TEST_APP_PATH='C:/Work/Git/MP-Tests/test_servers/de00b14719c0da34abefacdc31491b04_0.7.2.apk'", 
                      "APP_PATH='C:/Work/Git/MobilePro-Android/app/build/outputs/apk/app-dev-debug.apk'",
                      "ADB_DEVICE_ARG=emulator-5554", 
                      "PLATFORM=android", 
                      "-r features/support", 
                      "-r features/android", 
                      "-r features/step_definitions", 
                      "-r features/android/pages",
                      "SCREENSHOT_PATH='#{@screenshot_dir}' "
                       ]
    t.fork=true
end
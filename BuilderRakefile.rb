require 'fileutils'
require 'rubygems'
require 'yaml'

desc 'Build a "calabashed" version of the app'
task :create_cal_target do
  settings_file = 'config/cucumber.yml'
  configs = YAML.load_file settings_file

  project_dir = ENV.has_key?('TEST_IOS_PROJECT_DIR') ? ENV['TEST_IOS_PROJECT_DIR'] : configs['predefined_ios_project_dir_absolute_path']
  target_name = ENV.has_key?('TEST_IOS_TARGET_NAME') ? ENV['TEST_IOS_TARGET_NAME'] : configs['predefined_ios_target_name']

setup_cal_app_target = <<COMMAND
expect -c 'spawn calabash-ios setup #{project_dir}; expect "Please answer yes (y) or no (n)" {send -- "y\r"}; expect "Default target: #{target_name}. Just hit <Enter> to select default." {send "#{target_name}\r"}; expect "123";'
COMMAND

  sh setup_cal_app_target
end
  

desc 'Build a "calabashed" version of the app'
task :build_ios_simulator_app do
  settings_file = 'config/cucumber.yml'
  configs = YAML.load_file settings_file

  project_dir = ENV.has_key?('TEST_IOS_PROJECT_DIR') ? ENV['TEST_IOS_PROJECT_DIR'] : configs['predefined_ios_project_dir_absolute_path']
  project_name_with_path = ENV.has_key?('TEST_IOS_PROJECT_NAME') ? ENV['TEST_IOS_PROJECT_NAME'] : configs['predefined_ios_project_name']
  project_name_with_path = project_dir + '/' + project_name_with_path
  build_dir = ENV.has_key?('TEST_UTILS_APP_FOLDER') ? ENV['TEST_UTILS_APP_FOLDER'] : configs['predefined_ios_build_dir_absolute_path']
  target_name = ENV.has_key?('TEST_IOS_TARGET_NAME') ? ENV['TEST_IOS_TARGET_NAME'] : configs['predefined_ios_target_name']
  cal_target_name = target_name + '-cal'

  build_ios_app = <<COMMAND

xcrun xcodebuild \
-sdk iphonesimulator \
-project '#{project_name_with_path}' \
-target '#{cal_target_name}' \
  CONFIGURATION_BUILD_DIR='#{build_dir}' \
  clean build
COMMAND

  sh build_ios_app
end


desc 'Run all the calabash/cucumber acceptance tests on the simulator.'
task :build_app_for_ios_simulator => [:create_cal_target, :build_ios_simulator_app]do
end
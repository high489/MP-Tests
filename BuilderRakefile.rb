# encoding: UTF-8
require 'fileutils'
require 'rubygems'
require 'yaml'


def set_config_variables
  settings_file = 'config/cucumber.yml'
  configs = YAML.load_file settings_file

  @project_dir = ENV.has_key?('TEST_IOS_PROJECT_DIR') ? ENV['TEST_IOS_PROJECT_DIR'] : configs['predefined_ios_project_dir_absolute_path']
  @target_name = ENV.has_key?('TEST_IOS_TARGET_NAME') ? ENV['TEST_IOS_TARGET_NAME'] : configs['predefined_ios_target_name']
  @project_name_with_path = @project_dir + '/' + (ENV.has_key?('TEST_IOS_PROJECT_NAME') ? ENV['TEST_IOS_PROJECT_NAME'] : configs['predefined_ios_project_name'])
  @utils_app_dir = ENV.has_key?('TEST_UTILS_APP_FOLDER') ? ENV['TEST_UTILS_APP_FOLDER'] : configs['predefined_ios_app_dir_absolute_path']
  @cal_target_name = @target_name + '-cal'
end


desc 'Create "-cat" target in project'
task :create_cal_target do
  
  set_config_variables

setup_cal_app_target = <<COMMAND
expect -c 'spawn calabash-ios setup #{@project_dir}; \
expect "Please answer yes (y) or no (n)" \
{send -- "y\r"}; \
expect "Default target: #{@target_name}. Just hit <Enter> to select default." \
{send "#{@target_name}\r"}; \
expect "123";'
COMMAND

  sh setup_cal_app_target
end
  

desc 'Build a "calabashed" version of the app'
task :build_ios_simulator_app do

  set_config_variables

  build_ios_app = <<COMMAND
xcrun xcodebuild \
-sdk iphonesimulator \
-project '#{@project_name_with_path}' \
-target '#{@cal_target_name}' \
  CONFIGURATION_BUILD_DIR='#{@utils_app_dir}' \
  clean build
COMMAND

  sh build_ios_app
end


desc 'Run all the calabash/cucumber acceptance tests on the simulator.'
task :build_app_for_ios_simulator => [:create_cal_target, :build_ios_simulator_app]do
end
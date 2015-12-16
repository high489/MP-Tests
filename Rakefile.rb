require 'cucumber/rake/task'
require 'cucumber'
require 'rubygems'

# TEST_IOS_PROJECT_DIR
@predefined_ios_project_dir_absolute_path = '/Users/admin/Documents/MP-A3/'
# TEST_IOS_PROJECT_NAME
@predefined_ios_project_name = 'MobilePro.xcodeproj'
# TEST_IOS_TARGET_NAME
@predefined_ios_target_name = 'MobilePro'

# TEST_UTILS_APP_FOLDER
@predefined_ios_build_dir_absolute_path = '/Users/admin/Documents/MP-Tests/apps/'

# TEST_IOS_UDID // 
@predefined_ios_udid = '404AF286-C8B2-4206-A8CD-9C134036B25F'

# TEST_UTILS_SCREENSHOT_DIR
@predefined_screenshot_absolute_path = '/Users/admin/Documents/MP-Tests/report/screenshots/'
# TEST_UTILS_REPORT_DIR
@predefined_html_report_absolute_path = '/Users/admin/Documents/MP-Tests/report/'



#desc 'Build a "calabashed" version of the app'
#task :create_group_for_xcode_project do
#  project_dir = ENV.has_key?('TEST_IOS_PROJECT_DIR') ? ENV['TEST_IOS_PROJECT_DIR'] : @predefined_ios_project_dir_absolute_path
#  project_name_with_path = ENV.has_key?('TEST_IOS_PROJECT_NAME') ? ENV['TEST_IOS_PROJECT_NAME'] : @predefined_ios_project_name
#  project_name_with_path = project_dir + '/' + project_name_with_path
#  proj = Xcodeproj::Project.new(project_name_with_path)
#  #proj.new_group('Frameworks', path = nil, source_tree = :group)
#  proj.frameworks_group
#  proj.save(project_name_with_path)
#end


#Sample rake file

Cucumber::Rake::Task.new :features do |t|
    # App file with absolute path
  build_dir = ENV.has_key?('TEST_UTILS_APP_FOLDER') ? ENV['TEST_UTILS_APP_FOLDER'] : @predefined_ios_build_dir_absolute_path
  target_name = ENV.has_key?('TEST_IOS_TARGET_NAME') ? ENV['TEST_IOS_TARGET_NAME'] : @predefined_ios_target_name
  app_name_with_path = build_dir + '/' + target_name + '-cal.app'

  simulator_udid = ENV.has_key?('TEST_IOS_UDID') ? ENV['TEST_IOS_UDID'] : @predefined_ios_udid

  report_dir_absolute_path = ENV.has_key?('TEST_UTILS_REPORT_DIR') ? ENV['TEST_UTILS_REPORT_DIR'] : @predefined_html_report_absolute_path
  screenshot_dir_absolute_path = ENV.has_key?('TEST_UTILS_SCREENSHOT_DIR') ? ENV['TEST_UTILS_SCREENSHOT_DIR'] : @predefined_screenshot_absolute_path

  # Create folders for report and screenshots
  FileUtils.mkdir_p(report_dir_absolute_path)
  FileUtils.mkdir_p(screenshot_dir_absolute_path)

    t.cucumber_opts = [
                      "features/",
#                       ‘–tags’, ‘~@smoke’, # Exclude tests with @smoke tag
#                      ‘–tags’, ‘@smoke,@wip’,
                      "--format progress -o #{report_dir_absolute_path}/features.log",
                      "--format junit -o #{report_dir_absolute_path}/",
                      "--format html -o #{report_dir_absolute_path}/features.html",
                      "--format pretty ",
                      "DEVICE_TARGET='#{simulator_udid}' ",
                      "APP_BUNDLE_PATH='#{app_name_with_path}' ",
                      "SCREENSHOT_PATH='#{screenshot_dir_absolute_path}' "
                       ]
    t.fork=true
end

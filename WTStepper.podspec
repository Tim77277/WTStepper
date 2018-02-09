#
# Be sure to run `pod lib lint WTStepper.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'WTStepper'
  s.version          = '0.1.0'
  s.summary          = 'A customizable stepper purely written in Swift.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
WTStepper is a customizable stepper purely written in Swift. It is easy to use and beautiful.
                       DESC

  s.homepage         = 'https://github.com/Tim77277/WTStepper'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Wei-Ting Lin' => 'gsl0318@hotmail.com' }
  # s.version.to_s
  s.source           = { :git => 'https://github.com/Tim77277/WTStepper.git', :tag => '1.0.1' }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  s.source_files = 'WTStepper/Classes/*'
  
  # s.resource_bundles = {
  #   'WTStepper' => ['WTStepper/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  s.frameworks = 'UIKit', 'QuartzCore'
  # s.dependency 'AFNetworking', '~> 2.3'
end

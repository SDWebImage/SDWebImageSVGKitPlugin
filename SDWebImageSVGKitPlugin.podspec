#
# Be sure to run `pod lib lint SDWebImageSVGKitPlugin.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'SDWebImageSVGKitPlugin'
  s.version          = '1.3.0'
  s.summary          = 'A SVG coder plugin for SDWebImage, using SVGKit.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/SDWebImage/SDWebImageSVGKitPlugin'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'DreamPiggy' => 'lizhuoli1126@126.com' }
  s.source           = { :git => 'https://github.com/SDWebImage/SDWebImageSVGKitPlugin.git', :tag => s.version.to_s }

  s.ios.deployment_target = '9.0'
  s.tvos.deployment_target = '9.0'
  s.osx.deployment_target = '10.11'

  s.source_files = 'SDWebImageSVGKitPlugin/Classes/**/*', 'SDWebImageSVGKitPlugin/Module/SDWebImageSVGKitPlugin.h'
  s.module_map = 'SDWebImageSVGKitPlugin/Module/SDWebImageSVGKitPlugin.modulemap'
  
  s.dependency 'SDWebImage/Core', '~> 5.10'
  s.dependency 'SVGKit', '~> 3.0'
end

#
# Be sure to run `pod lib lint Indus-Valley.podspec' to ensure this is a
# valid spec and remove all comments before submitting the spec.
#
# Any lines starting with a # are optional, but encouraged
#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "IndusValley"
  s.version          = "0.1.1"
  s.summary          = "A short description of Indus-Valley."
  s.description      = <<-DESC
                       An optional longer description of Indus-Valley

                       * Markdown format.
                       * Don't worry about the indent, we strip it!
                       DESC
  s.homepage         = "https://github.com/haaakon/Indus-Valley"
  # s.screenshots     = "www.example.com/screenshots_1", "www.example.com/screenshots_2"
  s.license          = 'MIT'
  s.author           = { "Håkon Bogen" => "hakon.bogen@shortcut.no" }
  s.source           = { :git => "https://github.com/haaakon/Indus-Valley.git", :tag => s.version.to_s }

  s.platform     = :ios, '8.0'
  s.requires_arc = true

  s.source_files = 'IndusValley/*.swift',"IndusValley/**/*.strings"


  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end

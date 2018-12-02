#
# Be sure to run `pod lib lint ModalImage.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'ModalImage'
  s.version          = '0.1.0'
  s.summary          = 'ModalImage is for modal presenting images in an app.'

  s.homepage         = 'https://github.com/sofia.rozhina@gmail.com/ModalImage'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Sofia Rozhina' => 'sofia.rozhina@gmail.com' }
  s.source           = { :git => 'https://github.com/sofia.rozhina@gmail.com/ModalImage.git', :tag => s.version.to_s }

  s.ios.deployment_target = '12.1'
  s.source_files          = 'ModalImage/**/*.{swift}'
  s.resources             = 'ModalImage/**/*.{png,jpeg,jpg,storyboard,xib,xcassets}'

  s.frameworks = 'UIKit'
  
end

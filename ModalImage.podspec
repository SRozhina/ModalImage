Pod::Spec.new do |s|
  s.name             = 'ModalImage'
  s.version          = '0.1.1'
  s.summary          = 'ModalImage is for modal presenting images in an app.'

  s.homepage         = 'https://github.com/SRozhina/ModalImage'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Sofia Rozhina' => 'sofia.rozhina@gmail.com' }
  s.source           = { :git => 'https://github.com/SRozhina/ModalImage.git', :tag => s.version.to_s }
  s.swift_version = '4.2'

  s.ios.deployment_target = '12.1'
  s.source_files          = 'ModalImage/**/*.{swift}'
  s.resources             = 'ModalImage/**/*.{png,jpeg,jpg,storyboard,xib,xcassets}'

  s.frameworks = 'UIKit'
end

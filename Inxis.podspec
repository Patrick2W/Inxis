Pod::Spec.new do |s|
  s.name = 'Inxis'
  s.version = '0.0.1'
  s.license = 'MIT'
  s.summary = '🚀🚀🚀'
  s.homepage = 'https://github.com/Patrick2W/Inxis'
  s.social_media_url = ''
  s.authors = { 'Patrick2W' => 'whang_123_123@163.com' }
  s.source = { :git => 'https://github.com/Patrick2W/Inxis.git', :tag => s.version }
  s.ios.deployment_target = '9.0'
  s.ios.frameworks = 'UIKit', 'Foundation'
  s.source_files = 'Inxis/Inxis/*.swift'
  s.subspec 'Ext' do |ss|
    ss.source_files = 'Inxis/Inxis/{UIKit,Foundation}/*.swift'
  end
  s.subspec 'NavBar' do |ss|
    ss.source_files = 'Inxis/Inxis/NavBar/*.swift'
  end
  #s.resources = 'Inxis/Inxis/Resources'
  s.requires_arc = true
  s.swift_version = '5.0'
end

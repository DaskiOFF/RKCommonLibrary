Pod::Spec.new do |s|
  s.name     = 'RKCommonLibrary'
  s.version  = '0.0.1'
  s.license  = { :type => 'MIT', :file => 'LICENSE' }
  s.summary  = 'Common Library for iOS Project'
  s.homepage = 'https://github.com/DaskiOFF/RKCommonLibrary'
  s.authors  = { 'Roman Kotov' => 'waydeveloper@gmail.com' }
  s.source   = { :git => 'https://github.com/DaskiOFF/RKCommonLibrary', :tag => s.version.to_s}
  s.requires_arc = true
  s.platform = :ios, '7.1'
end
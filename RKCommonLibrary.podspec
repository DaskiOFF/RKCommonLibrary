Pod::Spec.new do |s|
  s.name         = "RKCommonLibrary"
  s.version      = "0.1.13"
  s.license      = { :type => 'MIT', :file => 'LICENSE' }
  s.summary      = "Common Library for iOS Project."
  s.homepage     = "https://github.com/DaskiOFF/RKCommonLibrary"
  s.author       = { "Roman Kotov" => "waydeveloper@gmail.com" }
  s.source       = { :git => "https://github.com/DaskiOFF/RKCommonLibrary.git", :tag => s.version.to_s }
  s.requires_arc = true
  s.platform     = :ios, "7.0"

  s.source_files  = "Classes/RKCL.{h,m}"
  s.public_header_files = "Classes/RKCL.h"

  s.framework  = "Foundation"
  
  # ――― Subspec ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  s.subspec 'UIView' do |ss|
    ss.source_files  = "Classes/UIView+RKUIViewCategory.{h,m}"
    ss.public_header_files = "Classes/UIView+RKUIViewCategory.h"
    ss.framework  = "Foundation"
  end

  s.subspec 'NSString' do |ss|
    ss.source_files  = "Classes/NSString+RKNSStringCategory.{h,m}"
    ss.public_header_files = "Classes/NSString+RKNSStringCategory.h"
    ss.framework  = "Foundation"
  end

  s.subspec 'NSDate' do |ss|
    ss.source_files  = "Classes/NSDate+RKNSDateCategory.{h,m}"
    ss.public_header_files = "Classes/NSDate+RKNSDateCategory.h"
    ss.framework  = "Foundation"
  end

  s.subspec 'UIColor' do |ss|
    ss.source_files  = "Classes/UIColor+RKUIColorCategory.{h,m}"
    ss.public_header_files = "Classes/UIColor+RKUIColorCategory.h"
    ss.framework  = "Foundation"
  end

  s.subspec 'UIViewController' do |ss|
    ss.source_files  = "Classes/UIViewController+RKUIViewControllerCategory.{h,m}"
    ss.public_header_files = "Classes/UIViewController+RKUIViewControllerCategory.h"
    ss.framework  = "Foundation"
  end

end

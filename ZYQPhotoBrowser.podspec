Pod::Spec.new do |s|
  s.name          =  "ZYQPhotoBrowser"
  s.summary       =  "Photo Browser / Viewer inspired by Facebook's and Tweetbot's with ARC support, swipe-to-dismiss, image progress and more."
  s.version       =  "1.0"
  s.homepage      =  "https://github.com/heroims/ZYQPhotoBrowser"
  s.license       =  { :type => 'MIT', :file => 'README.md' }
  s.author        =  { "Eduardo Callado" => "eduardo_tasker@hotmail.com" }
  s.source        =  { :git => "https://github.com/heroims/ZYQPhotoBrowser.git", :tag => "1.0" }
  s.platform      =  :ios, '6.0'
  s.requires_arc  =  true
  s.framework     =  'MessageUI', 'QuartzCore', 'SystemConfiguration', 'MobileCoreServices', 'Security'
  s.source_files  =  'ZYQPhotoBrowser/*.{h,m}'
  s.resources     =  'ZYQPhotoBrowser/ZYQPhotoBrowser.bundle', 'ZYQPhotoBrowser/ZYQPBLocalizations.bundle'
  s.dependency       'SDWebImage', '4.0.0'
  s.dependency       'DACircularProgress'
end

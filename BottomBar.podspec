Pod::Spec.new do |spec|

  spec.name         = "BottomBar"
  spec.version      = "1.0.0"
  spec.summary      = "Add a cool bottom bar to your projects to look like a tab bar"
  spec.description  = <<-DESC
  Hello. Add a cool bottom bar to your projects to look like a tab bar
                   DESC

  spec.homepage     = "http://www.nothing.com/BottomBar"
  spec.license      = { :type => "MIT", :file => "LICENSE" }
  spec.author             = { "Aitor Personal" => "" }

  spec.source       = { :git => "https://github.com/aitorsola/BottomBar.git", :tag => "master" }

  spec.social_media_url   = "https://twitter.com/aitornillo"
  spec.platform     = :ios, "11.0"

  spec.source_files = 'BottomBar/**/*.{h,m,swift,xib}'
  spec.exclude_files = "Pods"

  spec.swift_version = '5.0.1'

  spec.dependency 'SnapKit'
  spec.dependency 'Reusable'
  
end

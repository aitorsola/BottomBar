Pod::Spec.new do |spec|

  spec.name         = "BottomBar"
  spec.version      = "1.0.0"
  spec.summary      = "Add a cool bottom bar to your projects to look like a tab bar"
  spec.description  = <<-DESC
  Hello. Add a cool bottom bar to your projects to look like a tab bar
                   DESC

  spec.homepage     = "http://www.nothing.com/BottomBar"
  # spec.screenshots  = "www.example.com/screenshots_1.gif", "www.example.com/screenshots_2.gif"
  spec.license      = { :type => "MIT", :file => "LICENSE" }
  spec.author             = { "Aitor Personal" => "" }

  spec.social_media_url   = "https://twitter.com/aitornillo"
  spec.platform     = :ios, "11.0"

  spec.source       = { :path => "../BottomBar"}

  spec.source_files  = "**/*.{h,m,swift,xib}"
  spec.exclude_files = "Pods"

  spec.swift_version = '5.0.1'

  spec.dependency 'SnapKit'
  spec.dependency 'Reusable'
  
end

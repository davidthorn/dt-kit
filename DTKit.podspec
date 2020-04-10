Pod::Spec.new do |s|

s.name         = "DTKit"
s.version      = "0.1.0"
s.summary      = "A summary of your framework"
s.description  = <<-DESC
    A framework providing custom implemenations of UIKit and helper extensions.
DESC

s.homepage     = "https://github.com/davidthorn/dt-kit.git"

s.license      = { :type => "MIT" }

s.author       = { "David Thorn" => "david.thorn221278@googlemail.com" }

s.ios.deployment_target = "9.0"

s.source       = { :git => "https://github.com/davidthorn/dt-kit.git", :tag => "#{s.version}" }

s.source_files  = "DTKit/**/*.{swift}"

end

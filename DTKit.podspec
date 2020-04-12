Pod::Spec.new do |s|

s.name         = "DTKit"
s.version      = "0.2.8"
s.summary      = "A summary of your framework"
s.description  = <<-DESC
    A framework providing custom implemenations of UIKit and helper extensions.
DESC

s.homepage     = "https://github.com/davidthorn/dt-kit.git"

s.license      = { :type => "MIT" }

s.author       = { "David Thorn" => "david.thorn221278@googlemail.com" }

#s.ios.deployment_target = "9.0"

s.source       = { :git => "https://github.com/davidthorn/dt-kit.git", :tag => "#{s.version}" }

s.source_files  = "DTKit/Core/**/*.{swift}"

s.subspec 'DTCommon' do |sp|
  sp.source_files = "DTKit/Modules/DTCommon/**/*.{swift}"
  sp.dependency 'DTKit/DTKitExtensions'
end

s.subspec 'DTKitExtensions' do |sp|
  sp.source_files = "DTKit/Modules/DTKitExtensions/**/*.{swift}"
end

s.subspec 'Constraints' do |sp|
  sp.source_files = "DTKit/Modules/Constraints/**/*.{swift}"
  sp.dependency 'DTKit/DTKitExtensions'
end

s.subspec 'DTInputField' do |sp|
  sp.source_files = "DTKit/Modules/DTInputField/**/*.{swift}"
  sp.dependency 'DTKit/DTCommon'
end

s.subspec 'DTForms' do |sp|
  sp.source_files = "DTKit/Modules/DTForms/**/*.{swift}"
  sp.dependency 'DTKit/DTCommon'
end

s.subspec 'DTRepresentations' do |sp|
  sp.source_files = "DTKit/Modules/DTRepresentations/**/*.{swift}"
  sp.dependency 'DTKit/DTForms'
end

s.subspec 'Core' do |sp|
  sp.dependency 'DTKit/DTRepresentations'
end



end

Pod::Spec.new do |s|
  s.name             = 'Coordinator'
  s.version          = '0.0.1'
  s.summary          = 'Coordinator framework'
  s.homepage         = 'https://github.com/FJsaldivar/CoordinatorKit'
  #s.license          = { :type => 'MIT', :file => 'LICENSE.md' }
  s.author           = 'Francisco Javier Saldivar Rubio'
  s.source           = { :git => 'https://github.com/FJsaldivar/CoordinatorKit.git', :tag => s.version.to_s }
  s.ios.deployment_target = '13.0'
  s.swift_version = '5.0'
  s.source_files = 'Sources/Coordinator/**/*'
end
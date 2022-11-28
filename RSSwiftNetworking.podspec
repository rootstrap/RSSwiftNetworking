Pod::Spec.new do |s|
  s.name             = 'RSSwiftNetworking'
  s.version          = '1.1.2'
  s.summary          = 'A flexible network layer API written in Swift.'

  s.description      = 'A flexible network layer API written in Swift. Compatible with iOS, iPadOS and tvOS.'

  s.homepage         = 'https://github.com/rootstrap/RSSwiftNetworking'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'rootstrap' => 'german@rootstrap.com' }
  s.source           = { :git => 'https://github.com/rootstrap/RSSwiftNetworking.git',
                         :tag => s.version.to_s
                       }
  s.social_media_url = 'https://www.rootstrap.com/'
  
  s.ios.deployment_target = '15.0'
  s.osx.deployment_target = '12.0'
  s.tvos.deployment_target = '15.0'

  s.swift_version = '5.5'

  s.default_subspec = 'Core'
  s.subspec 'Core' do |core_spec|
      core_spec.source_files = 'Sources/RSSwiftNetworking/**/*'
  end

  s.subspec 'AlamofireProvider' do |alamofire_spec|
    alamofire_spec.source_files = 'Sources/RSSwiftNetworkingAlamofire/*'
    alamofire_spec.dependency 'RSSwiftNetworking/Core'
    alamofire_spec.dependency 'Alamofire', '5.2.0'
  end
end

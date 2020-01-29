Pod::Spec.new do |s|
  s.name             = 'CombineReachability'
  s.version          = '1.0.0'
  s.summary          = 'Combine publishers for Reachability'

  s.description      = <<-DESC
  CombineReachability adds easy to use Combine publishers for [ReachabilitySwift](https://github.com/ashleymills/Reachability.swift).
  It adds the ability to react to network reachability changes in a reactive way using the power of Combine.
  This library was inspired by the RxSwift Community's [RxReachability](https://github.com/RxSwiftCommunity/RxReachability) library.
                        DESC

  s.homepage          = 'https://github.com/istvan-kreisz/CombineReachability.git'
  s.license           = { :type => 'MIT', :file => 'LICENSE.md' }
  s.authors           = { 'Istvan Kreisz' => 'kreiszdev@gmail.com' }
  s.source            = { :git => 'https://github.com/istvan-kreisz/CombineReachability.git', :tag => "1.0.0" }
  s.source_files      = 'Sources/CombineReachability/*'

  s.ios.deployment_target   = '13.0'
  s.osx.deployment_target   = '10.15'
  s.tvos.deployment_target  = '13.0'

  s.frameworks = 'Foundation'

  s.swift_version    = '5.1'

  s.dependency 'ReachabilitySwift', '~> 5.0.0'
end

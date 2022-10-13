Pod::Spec.new do |s|
    s.name             = 'GroupByTracker'
    s.version          = '0.1.2'
    s.summary          = 'GroupBy Tracker Client for iOS'
    s.homepage         = 'https://github.com/groupby/gb-ios-tracker-client.git'
    s.license          = { :type => 'MIT', :file => 'LICENSE.md' }
    s.author           = { 'GroupBy Inc.' => 'support@groupbyinc.com' }
    s.source           = { :git => 'https://github.com/groupby/gb-ios-tracker-client.git', :tag => s.version.to_s }
    s.ios.deployment_target = '11.0'
    s.swift_version = '4.0'
    s.source_files = 'Sources/GroupByTracker/**/*'
    s.frameworks = 'UIKit'
  end

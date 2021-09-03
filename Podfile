# Uncomment the next line to define a global platform for your project
platform :ios, '9.0'

target 'BlackMarket' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

 

  pod 'lottie-ios'
  pod 'TTGTagCollectionView'
  pod 'JGProgressHUD','~>2.0.3'

  pod 'Firebase/Core'
  pod 'Firebase/Storage'
  pod 'Firebase/Auth'
  pod 'Firebase/Firestore'
 
  pod 'SDWebImage','~>4.4.2'
  pod 'SCLAlertView'

  target 'BlackMarketTests' do
    inherit! :search_paths
    # Pods for testing
  end

  target 'BlackMarketUITests' do
    # Pods for testing
  end

end

post_install do |installer|
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
      config.build_settings["EXCLUDED_ARCHS[sdk=iphonesimulator*]"] = "arm64"
    end
  end
end

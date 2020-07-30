# MODULE_REACT_NATIVE
This project is a React Native module that is ready to be imported in other native Android/iOS projects.


create project react native

run npx react-native init MyModule

create `MyModule.podspec` to expose ios folder to be imported in others projects

just like that `Pod::Spec.new do |s|
    s.name         = "MyModule"
    s.version      = "1.0"
    s.summary      = "MyModule"
    s.description  = "MyModule"
    s.homepage     = "MyModule.com"
    s.license      = "Private"
    s.author       = { "Roberto Oliveira & Yasminn" => "" }
    s.source       = { :git => "https://github.com/betonix/module-react-native-to-be-integrate-on-native.git", :branch => 'master' }
    s.source_files = "ios/MyModule/**/*.{swift,h,m}"
    s.ios.deployment_target  = '10.0'

    s.resources = ['ios/assets/*','ios/index.ios.jsbundle']
  
    s.dependency 'React'
    s.dependency 'React-Core'
    s.dependency 'React-CoreModules'
    s.dependency 'React-Core/DevSupport'
    s.dependency 'React-RCTActionSheet'
    s.dependency 'React-RCTAnimation'
    s.dependency 'React-RCTBlob'
    s.dependency 'React-RCTImage'
    s.dependency 'React-RCTLinking'
    s.dependency 'React-RCTNetwork'
    s.dependency 'React-RCTSettings'
    s.dependency 'React-RCTText'
    s.dependency 'React-RCTVibration'
    s.dependency 'React-Core/RCTWebSocket'

  end`

## iOS

### Preparing to export
First, you need to create the `SellingCartApp.podspec` file, which contains the project's information and the git URL where it should be hosted. 

Pay attention to the line `s.resources = 'ios/Pod/Assets/*'`, this is where we are setting the path to the `index.ios.jsbundle` file.

### Publishing
1. Run `yarn run build-ios-bundle` to create the file `index.ios.jsbundle` inside the `'ios/Pod/Assets/'` folder. 
2. Commit and push to the repo, so that the external projects can use it.


## Android

### Preparing to export
First, you need to create a folder `assets` inside `SellingCartLibrary/src/main`

###  Publishing

1. Run `yarn run build-android-bundle` to create the bundle
2. Run `./gradlew :SellingCartLibrary:assembleRelease` to generate the .aar
3. The artifact will be available at `android/SellingCartLibrary/build/outputs/aar/`.
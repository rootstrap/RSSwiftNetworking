# RSSwiftNetworking

[![CI Status](https://img.shields.io/travis/rootstrap/RSSwiftNetworking.svg?style=flat)](https://travis-ci.org/rootstrap/RSSwiftNetworking)
[![Version](https://img.shields.io/cocoapods/v/RSSwiftNetworking.svg?style=flat)](https://cocoapods.org/pods/RSSwiftNetworking)
[![License](https://img.shields.io/cocoapods/l/RSSwiftNetworking.svg?style=flat)](https://cocoapods.org/pods/RSSwiftNetworking)
[![Platform](https://img.shields.io/cocoapods/p/RSSwiftNetworking.svg?style=flat)](https://cocoapods.org/pods/RSSwiftNetworking)
[![Carthage](https://img.shields.io/badge/Carthage-compatible-success)](#installation)
[![SPM](https://img.shields.io/badge/SPM-compatible-success)](#installation)
[![Swift Version](https://img.shields.io/badge/Swift%20Version-5.2-orange)](https://cocoapods.org/pods/RSSwiftNetworking)

## What is it?

## Installation

#### 1. Cocoapods

```ruby

pod 'RSSwiftNetworking', '~> 1.1.4'

```

#### 2. Carthage

[Carthage](https://github.com/Carthage/Carthage) is a decentralized dependency manager that builds your dependencies and provides you with binary frameworks.
Add the following line to your `Cartfile` and follow the [installation instructions](https://github.com/Carthage/Carthage#adding-frameworks-to-an-application).

```
github "rootstrap/RSSwiftNetworking" ~> 1.1.3
```

#### 3. Swift Package Manager

- In XCode 11, go to File -> Swift Packages -> Add Package Dependency.
- Enter the repo URL (https://github.com/rootstrap/RSSwiftNetworking) and click Next.
- Select the version rule desired (you can specify a version number, branch or commit) and click Next.
- Finally, select the target where you want to use the framework.

That should be it. **RSSwiftNetworking** should appear in the navigation panel as a dependency and the framework will be linked automatically to your target.


**Note:** It is always recommended to lock your external libraries to a specific version.

## Usage

RSSwiftNetworking provides you with an extensible API to implement your own networking layer.

It also gives you an out of the box solution with Alamofire as the `NetworkProvider`. 
You can simply create your APIClient concrete instace with this provider.

```
static let apiClient = BaseAPIClient(
    networkProvider: AlamofireNetworkProvider(),
    headersProvider: SomeHeaderProvider()
)
```

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.


## License

**RSSwiftNetworking** is available under the MIT license. See the LICENSE file for more info.

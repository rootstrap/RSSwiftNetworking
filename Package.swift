// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "RSSwiftNetworking",
  platforms: [.iOS(.v12), .tvOS(.v10), .macOS(.v11)],
  products: [
    .library(name: "RSSwiftNetworking", targets: ["RSSwiftNetworking"]),
    .library(name: "RSSwiftNetworkingAlamofire", targets: ["RSSwiftNetworkingAlamofire", "RSSwiftNetworking"])
  ],
  dependencies: [
    .package(
        name: "Alamofire",
        url: "https://github.com/Alamofire/Alamofire.git",
        from: "5.2.0"
    ),
  ],
  targets: [
    .target(name: "RSSwiftNetworking", dependencies: []),
    .target(name: "RSSwiftNetworkingAlamofire", dependencies: [
        .target(name: "RSSwiftNetworking"),
        .product(name: "Alamofire", package: "Alamofire")
    ]),
  ]
)

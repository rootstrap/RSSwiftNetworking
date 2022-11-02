// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "RSSwiftNetworking",
  platforms: [.iOS(.v13), .tvOS(.v15), .macOS(.v12)],
  products: [
    .library(name: "RSSwiftNetworking", targets: ["RSSwiftNetworking"]),
    .library(name: "RSSwiftNetworkingAlamofire", targets: ["RSSwiftNetworkingAlamofire", "RSSwiftNetworking"])
  ],
  dependencies: [
    .package(
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

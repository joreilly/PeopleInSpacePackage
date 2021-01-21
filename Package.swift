// swift-tools-version:5.3
import PackageDescription

let package = Package(
    name: "PeopleInSpace",
    platforms: [
        .iOS(.v13)
    ],
    products: [
        .library(
            name: "PeopleInSpace",
            targets: ["PeopleInSpace"]
        ),
    ],
    targets: [
        .binaryTarget(
            name: "PeopleInSpace",
            path: "./PeopleInSpace.xcframework"
        ),
    ]
)

// swift-tools-version:5.9
import PackageDescription

let package = Package(
    name: "PeopleInSpaceKit",
    platforms: [
        .iOS(.v14),
.macOS(.v12)
    ],
    products: [
        .library(
            name: "PeopleInSpaceKit",
            targets: ["PeopleInSpaceKit"]
        ),
    ],
    targets: [
        .binaryTarget(
            name: "PeopleInSpaceKit",
            path: "./PeopleInSpaceKit.xcframework"
        ),
    ]
)

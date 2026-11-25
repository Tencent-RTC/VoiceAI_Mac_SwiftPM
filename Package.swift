// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "VoiceAI_Mac_SwiftPM",
    platforms: [
        .macOS(.v10_13)
    ],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "VoiceAI_Mac_SwiftPM",
            targets: ["VoiceAI_Mac_SwiftPM"])
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .binaryTarget(
            name: "TXLiteAVSDK_VoiceAI_Mac",
            url: "https://dl.gmertc.com/voiceai/13.6.0/VoiceAI_Mac_sdk_13.6.0.255.zip",
            checksum: "b0b2da865d7265a48db1cbdbec97c714a2ba7f1ff2433f2cbfa46fbf13643537"
        ),
        .target(
            name: "VoiceAI_Mac_SwiftPM",
            dependencies: [
                .target(name: "TXLiteAVSDK_VoiceAI_Mac")
            ],
            path: "Sources/VoiceAI_Mac_SwiftPM",
            linkerSettings: [
                .linkedFramework("AVFoundation"),
                .linkedFramework("AudioToolbox"),
                .linkedFramework("CoreAudio"),
                .linkedFramework("CoreMedia"),
                .linkedFramework("CoreFoundation"),
                .linkedFramework("CoreGraphics"),
                .linkedFramework("CoreText"),
                .linkedFramework("CoreServices"),
                .linkedFramework("CFNetwork"),
                .linkedFramework("Accelerate"),
                .linkedFramework("Security"),
                .linkedFramework("SystemConfiguration"),
                .linkedFramework("AppKit"),
                .linkedLibrary("c++")
            ]
        )
    ]
)

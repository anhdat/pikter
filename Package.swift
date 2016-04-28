import PackageDescription

let package = Package(
    name: "pikter",
    targets: [
        Target(
            name: "pikter",
            dependencies: [.Target(name: "ImagePrinting")]),
        Target(name: "ImagePrinting"),
    ],
    dependencies: [
        .Package(url: "https://github.com/docopt/docopt.swift.git", Version(0,6,4)),
    ]
)

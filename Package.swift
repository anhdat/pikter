import PackageDescription

let package = Package(
    name: "pikter",
    dependencies: [
        .Package(url: "https://github.com/docopt/docopt.swift.git", Version(0,6,4)),
    ]
)

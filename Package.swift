import PackageDescription

let package = Package(
    name: "pikter",
    targets: [
        Target(name: "pikter", dependencies: ["Docopt"]),
    ],
    dependencies: [
    ]
)

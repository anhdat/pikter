import PackageDescription

let package = Package(
    name: "imgter",
    targets: [
        Target(name: "imgter", dependencies: ["Docopt"]),
    ],
    dependencies: [
    ]
)

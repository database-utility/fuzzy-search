// swift-tools-version: 5.5
import PackageDescription

let package = Package(
  name: "fuzzy-search",
  products: [
    .library(name: "FuzzySearch", targets: ["FuzzySearch"])
  ],
  targets: [
    .target(name: "FuzzySearch"),
    .testTarget(name: "FuzzySearchTests", dependencies: ["FuzzySearch"], resources: [
      .copy("Fixtures/spanish-words.json")
    ])
  ]
)

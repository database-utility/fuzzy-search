# FuzzySearch

[![Build Status](https://travis-ci.org/viktorasl/FuzzySearch.svg)](https://travis-ci.org/viktorasl/FuzzySearch)

Lightweight Fuzzy evaluation protocol with CollectionType extension

## Requirements

iOS 8.0+
Swift 2.3

## Usage

### Implementing FuzzySearchable protocol

```swift
struct PlayerModel {
  let name: String
  let position: String
  let goals: Int
}
```

Implementation of `FuzzySearchable` protocol defines against what search patterns will be evaluated.
```swift
extension PlayerModel: FuzzySearchable {
  var fuzzyStringToMatch: String {
    return name
  }
}
```

### Evaluating single `FuzzySearchable` instance

```swift
let maradona = PlayerModel(name: "Diego Maradona", position: "F", goals: 16)
maradona.fuzzyMatch("diema") // FuzzySearchResult(weight: 15, parts: [(0,3), (6,2)])
```

#### `FuzzySearchResult`

Result of evaluation carries two properties:
- `weight` - weight of the match
- `parts` - `NSRange`'s of pattern matching against `fuzzyStringToMatch`

### Evaluating collection of `FuzzySearchable`s

When evaluating collection of `FuzzySearchable`s result is an array of tuples `(item: Generator.Element, result: FuzzySearchResult)` which is filtered and sorted depending on `weight`.

```swift

let players = [
  PlayerModel(name: "Diego Maradona", position: "CF", goals: 16),
  PlayerModel(name: "David Beckham", position: "CAM", goals: 8),
  PlayerModel(name: "Lionel Messi", position: "RW", goals: 15)
]
players.fuzzyMatch("di")
//[
// (
//  FuzzySearchTests.PlayerModel(name: "Diego Maradona", position: "CF", goals: 16),
//  FuzzySearch.FuzzySearchResult(weight: 4, parts: [(0,2)])
// ), (
//  FuzzySearchTests.PlayerModel(name: "David Beckham", position: "CAM", goals: 8),
//  FuzzySearch.FuzzySearchResult(weight: 2, parts: [(0,1), (3,1)])
// )
//]
```

## License

FuzzySearch is released under the [MIT](LICENSE) license.

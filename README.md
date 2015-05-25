# Indus-Valley
A library for converting between units of measurement, written in Swift. Has support for localization and blind allocation of objects if you don't know what type they are prior to creation.

## Usage
#### Creating objects
```swift
let mass = Mass(quantity: 1, unit: .Gram)
let volume = Volume(quantity: 3, unit: .Liter)
let anotherMass = Mass(quantity: 4, unit: "gram") // quanity: 4, unit: .Gram
```

#### Blind creation
```swift
let aMass = Measurement.unknownUnitWithString("kilogram", quantity: 3) // class: Mass, quantity: 3, unit: .Kilo
let anotherMass = Measurement.unknownUnitWithString("pizza", quantity: 3) // nil
let aVolume = Measurement.unknownUnitWithString("l", quantity: 3) //  class: Volume, quantity: 3, unit: .Liter
```

#### Converting
From Gram to Kilogram
```swift
let grams = Mass(quantity: 1000, unit: MassUnit.Gram)
let convertedToKilo = grams.convert(toUnit: MassUnit.Kilo)  // creates object with quantity:1, unit: .Kilo
```

#### Adding
```swift
let singleGram = Mass(quantity: 1, unit: .Gram)
let lotsOfGrams = Mass(quantity: 99, unit: .Gram)
let result = singleGram + lotsOfGrams                     // result is Mass with quantity: 100, unit: .Gram
```

###

#### Blind creation
```swift
let aMass = Measurement.unknownUnitWithString("kilogram", quantity: 3) // class: Mass, quantity: 3, unit: .Kilo
let anotherMass = Measurement.unknownUnitWithString("pizza", quantity: 3) // nil
let aVolume = Measurement.unknownUnitWithString("l", quantity: 3) //  class: Volume, quantity: 3, unit: .Liter
```



#Under construction

# TODO:
- Subtraction
- 100 % working Volume
- Localization
- More different units

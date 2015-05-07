//
//  MassTests.swift
//  Indus Valley
//
//  Created by Håkon Bogen on 19/04/15.
//  Copyright (c) 2015 haaakon. All rights reserved.
//

import UIKit
import XCTest


struct MassTestsConstants {
    struct UniversalAlternativeNames {
        struct Kilo {
            static let kgs = "kgs"
            static let kg = "kgs"
            static let kilogram = "kilogram"
            static let kilograms = "kilograms"

        }

        struct Gram {
            static let grams = "grams"
        }
    }

}

class MassTests: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testCreateMass() {
        let oneKilogram = Mass(quantity: 1, unit: MassUnit.Kilo)
        XCTAssert(oneKilogram.quantity == 1, "one kilogram was not set with correct value")
        XCTAssert(oneKilogram.unit == MassUnit.Kilo, "one kilogram did not get correct unit")
    }

    func testCreateGramMassFromString() {
        let mass = Mass.fromString("g", quantity: 1)
        XCTAssertTrue(mass?.quantity == 1, "couldn't create correct mass")
        XCTAssertTrue(mass?.unit == MassUnit.Gram, "Could not create mass from string \"g\", got \(mass?.unit)")
    }

    func testCreateGramMassFromAlternativeNameString() {
        let mass = Mass.fromString("gram", quantity: 1)
        XCTAssertTrue(mass?.quantity == 1, "couldn't create correct mass, expected quantity 1, got \(mass?.quantity)")
        XCTAssertTrue(mass?.unit == MassUnit.Gram, "Could not create mass from string \"gram\", got \(mass?.unit)")
    }

    func testCreateGramMassFromAlternativeNameString2() {
        let mass = Mass.fromString("grams", quantity: 1)
        XCTAssertTrue(mass?.quantity == 1, "couldn't create correct mass, expected quantity 1, got \(mass?.quantity)")
        XCTAssertTrue(mass?.unit == MassUnit.Gram, "Could not create mass from string \"grams\", got \(mass?.unit)")
    }

    func testConvertGramToKilogram() {
        var kilogram = Mass(quantity: 1000, unit: MassUnit.Gram)
        kilogram.convert(toUnit: .Kilo)
        XCTAssert(kilogram.quantity == 1, "could not convert to kilo, expected \(1), got \(kilogram.quantity)")
        XCTAssert(kilogram.unit == MassUnit.Kilo, "could not convert gram to kil, expected Kilo, got \(kilogram.unit)")
    }

    func testConvertKiloToGram() {
        var gram = Mass(quantity: 1, unit: .Kilo)
        gram.convert(toUnit: .Gram)
        XCTAssert(gram.quantity == 1000, "could not convert to gram, expected \(1000), got \(gram.quantity)")
        XCTAssert(gram.unit == MassUnit.Gram, "could not convert kilogram to grams, expected Gram, got \(gram.unit)")
    }


    /**
    Adding
    */
    func testAddGramToKilogram() {
        let singleGram = Mass(quantity: 1, unit: .Gram)
        let singleKilogram = Mass(quantity: 1, unit: .Kilo)
//        let addedTogether = singleGram + singleKilogram
//        XCTAssert(addedTogether.quantity == 1001, "1 gram + 1 kilo, value should be 1001 gram, was \(addedTogether.quantity)")
//        XCTAssert(addedTogether.unit == .Gram, "1 gram + 1 kilo, unit should be gram, was \(addedTogether.unit)")
    }

    func testAddGramToGram() {
        let singleGram = Mass(quantity: 1, unit: .Gram)
        let lotsOfGrams = Mass(quantity: 99, unit: .Gram)
        MassTests.add(singleGram, withMass: lotsOfGrams, expect: Mass(quantity: 100, unit: .Gram))
    }


    func testAddGramToOunce() {
        let singleGram = Mass(quantity: 1, unit: .Gram)
        let singleOunce = Mass(quantity: 1, unit: .Ounce)
        MassTests.add(singleGram, withMass: singleOunce, expect: Mass(quantity:29.3495231, unit: .Gram))
    }

    func testAddOunceToKilo() {
        let singleOunce = Mass(quantity: 1, unit: .Ounce)
        let singleKilogram = Mass(quantity: 1, unit: .Kilo)
        MassTests.add(singleOunce, withMass: singleKilogram, expect: Mass(quantity: 36.2739619, unit: .Ounce))
    }

    /**
     Naming
    */
    func testAlternativeNames() {
        let mass = Mass(quantity: 1, unit: .Kilo)
        let names = mass.alternativeNames()
        XCTAssertTrue(contains(names, MassTestsConstants.UniversalAlternativeNames.Kilo.kgs))
        XCTAssertTrue(contains(names, MassTestsConstants.UniversalAlternativeNames.Kilo.kg))
    }

    func testWrongAlternativeNames() {
        let mass = Mass(quantity: 1, unit: .Gram)
        let names = mass.alternativeNames()
        XCTAssertFalse(contains(names, MassTestsConstants.UniversalAlternativeNames.Kilo.kgs))
        XCTAssertFalse(contains(names, MassTestsConstants.UniversalAlternativeNames.Kilo.kilograms))
    }

    func testPerformanceOfAlternativeName() {
        let randomStrings = self.arrayWithRandomCombinations()
        measureBlock { () -> Void in
            for randomCombination in randomStrings {
                let mass = Mass.fromString(randomCombination, quantity: 1)
            }
        }

    }

    // convenience method for testing add with an expected value
    class func add(mass : Mass, withMass: Mass, expect: Mass) {
//        let addedTogether = mass + withMass
//        XCTAssertEqualWithAccuracy(addedTogether.quantity, expect.quantity, 0.0001, "\(mass.quantity) \(mass.unit) + \(withMass.quantity) \(withMass.unit), expected \(expect.quantity), got \(addedTogether.quantity)  ")
//        XCTAssert(addedTogether.unit == expect.unit, "\(mass.quantity) \(mass.unit) + \(withMass.quantity) \(withMass.unit), expected  \(expect.unit), got  \(addedTogether.unit) ")
    }

}

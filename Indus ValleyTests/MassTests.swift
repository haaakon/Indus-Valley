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
    //
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
//
    func testCreateGramMassFromString() {
        let mass = Mass(quantity: 1, unit: "g")
        XCTAssertTrue(mass?.quantity == 1, "couldn't create correct mass")
        XCTAssertTrue(mass?.unit == MassUnit.Gram, "Could not create mass from string \"g\", got \(mass?.unit)")
    }

    func testCreateGramMassFromAlternativeNameString() {
        let mass = Mass(quantity: 1, unit: "grams")
        
        XCTAssertTrue(mass?.quantity == 1, "couldn't create correct mass, expected quantity 1, got \(mass?.quantity)")
        XCTAssertTrue(mass?.unit == MassUnit.Gram, "Could not create mass from string \"gram\", got \(mass?.unit)")
    }
//
    func testCreateGramMassFromAlternativeNameString2() {
        let mass = Mass(quantity: 1, unit: "gram")
        XCTAssertTrue(mass?.quantity == 1, "couldn't create correct mass, expected quantity 1, got \(mass?.quantity)")
        XCTAssertTrue(mass?.unit == MassUnit.Gram, "Could not create mass from string \"grams\", got \(mass?.unit)")
    }
//
//    func testCreateUknonwnMass() {
//        let unknownMass = Mass(quantity: 100, unit: .Unknown)
//        XCTAssertTrue(unknownMass.quantity == 100, "couldn't create correct mass, expected quantity 100, got \(unknownMass.quantity)")
//        XCTAssertTrue(unknownMass.unit == MassUnit.Unknown, "Could not create mass with unknown unit \"\", got \(unknownMass.unit)")
//    }
//
//    /**
//    Negative testing
//    */
//
    func testShouldNotCreateMassFromString() {
        let notAMass = Mass(quantity: 3, unit: "not a mass")
        XCTAssertFalse(notAMass?.quantity == 3 , "invalid mass should not have a quantity")
        XCTAssertFalse(notAMass?.unit == MassUnit.Gram, "invalid mass should not have a unit")
        XCTAssertTrue(notAMass == nil, "not a mass should be nil")
    }
    
    func testConvertGramToKilogram() {
        var kiloInGrams = Mass(quantity: 1000, unit: MassUnit.Gram)
        kiloInGrams.convert(toUnit: MassUnit.Kilo)
        XCTAssert(kiloInGrams.quantity == 1, "could not convert to kilo, expected \(1), got \(kiloInGrams.quantity)")
        XCTAssert(kiloInGrams.unit == MassUnit.Kilo, "could not convert gram to kil, expected Kilo, got \(kiloInGrams.unit)")
    }

    func testConvertKiloToGram() {
        var kiloToGram = Mass(quantity: 1, unit: MassUnit.Kilo)
        kiloToGram.convert(toUnit: MassUnit.Gram)
        XCTAssert(kiloToGram.quantity == 1000, "could not convert to gram, expected \(1000), got \(kiloToGram.quantity)")
        XCTAssert(kiloToGram.unit == MassUnit.Gram, "could not convert kilogram to grams, expected Gram, got \(kiloToGram.unit)")
//        XCTAssertNotNil(kiloToGram as? Mass, "after convertion, class got mixed up")

    }

//    /**
//    Adding
//    */
    func testAddGramToKilogram() {
        let singleGram = Mass(quantity: 1, unit: MassUnit.Gram)
        let singleKilogram = Mass(quantity: 1, unit: MassUnit.Kilo)
        let addedTogether = singleGram + singleKilogram
        XCTAssert(addedTogether.quantity == 1001, "1 gram + 1 kilo, value should be 1001 gram, was \(addedTogether.quantity)")
        XCTAssert(addedTogether.unit == MassUnit.Gram, "1 gram + 1 kilo, unit should be gram, was \(addedTogether.unit)")
    }
//
    func testAddGramToGram() {
        let singleGram = Mass(quantity: 1, unit: MassUnit.Gram)
        let lotsOfGrams = Mass(quantity: 99, unit: MassUnit.Gram)
        MassTests.add(singleGram, withMass: lotsOfGrams, expect: Mass(quantity: 100, unit: MassUnit.Gram))
    }

    func testAddGramToOunce() {
        let singleGram = Mass(quantity: 1, unit: MassUnit.Gram)
        let singleOunce = Mass(quantity: 1, unit: MassUnit.Ounce)
        MassTests.add(singleGram, withMass: singleOunce, expect: Mass(quantity: 29.3495231, unit: MassUnit.Gram))
    }

    func testAddOunceToKilo() {
        let singleOunce = Mass(quantity: 1, unit: MassUnit.Ounce)
        let singleKilogram = Mass(quantity: 1, unit: MassUnit.Kilo)
        MassTests.add(singleOunce, withMass: singleKilogram, expect: Mass(quantity: 36.2739619, unit: MassUnit.Ounce))
    }
//
//    /**
//    Naming
//    */
//    func testKilogramLongformNameFromLocalizationFile() {
//        let kilogram = Mass(quantity: 1, unit: .Kilo)
//        let kilograms = Mass(quantity: 2, unit: .Kilo)
//        let localizedPluralName = NSLocalizedString("KG_LONGFORM_PLURAL", tableName: "Mass", bundle: NSBundle(forClass: self.dynamicType), comment: "")
//        let localizedSingularName = NSLocalizedString("KG_LONGFORM_SINGULAR", tableName: "Mass", bundle: NSBundle(forClass: self.dynamicType), comment: "")
//        XCTAssertTrue(localizedPluralName == kilograms.longformUnitName, "\(localizedPluralName) did not match \(kilograms.longformUnitName)")
//        XCTAssertTrue(localizedSingularName == kilogram.longformUnitName, "\(localizedSingularName) did not match \(kilogram.longformUnitName)")
//    }
//
    func testCreateUnknownMeasurementFromString() {
        let quantity : Double = 3
        let kilogram = measurementFromUnknownUnitWithString("kg", quantity: quantity)
        if let actualMass = kilogram as? Mass {
            XCTAssertEqual(actualMass.quantity, quantity)
            XCTAssertTrue(actualMass.unit.name == MassUnit.Kilo.name)
        } else {
            XCTAssertTrue(false)
        }
    }

    func testKilogramLongformNameFromKnownString() {
        let kilogram = Mass(quantity: 1, unit: MassUnit.Kilo)
        let kilograms = Mass(quantity: 2, unit: MassUnit.Kilo)
        XCTAssertTrue("kilograms" == kilograms.longformUnitName, "kilograms did not match \(kilograms.longformUnitName)")
        XCTAssertTrue("kilogram" == kilogram.longformUnitName, "kilogram did not match \(kilogram.longformUnitName)")
    }

    func testPerformanceOfAlternativeName() {
        let randomStrings = self.arrayWithRandomCombinations()
        measureBlock { () -> Void in
            for randomCombination in randomStrings {
                _ = Mass(quantity: 4, unit: randomCombination)
            }
        }
    }

    func testPerformanceOfAlternativeNameWithUnknownMeasurementClass() {
        let randomStrings = self.arrayWithRandomCombinations()
        measureBlock { () -> Void in
            for randomCombination in randomStrings {
                _ = measurementFromUnknownUnitWithString(randomCombination, quantity: 2)
            }
        }
    }

//    // convenience method for testing add with an expected value
    class func add(mass : Mass, withMass: Mass, expect: Mass) {
        let addedTogether = mass + withMass
        XCTAssertEqualWithAccuracy(addedTogether.quantity, expect.quantity, accuracy: 0.0001, "\(mass.quantity) \(mass.unit) + \(withMass.quantity) \(withMass.unit), expected \(expect.quantity), got \(addedTogether.quantity)  ")
        XCTAssert(addedTogether.unit.name == expect.unit.name, "\(mass.quantity) \(mass.unit) + \(withMass.quantity) \(withMass.unit), expected  \(expect.unit), got  \(addedTogether.unit) ")
    }

}

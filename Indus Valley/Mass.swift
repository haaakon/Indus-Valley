
//  Mass.swift
//  Indus Valley
//
//  Created by Håkon Bogen on 19/04/15.
//  Copyright (c) 2015 haaakon. All rights reserved.
//

import Foundation

struct Mass : UnitConstruct {

    let quantity: Double
    let unit  : MassUnit

    init(quantity: Double, unit: MassUnit) {
        self.quantity = quantity
        self.unit = unit
    }

    init?(quantity: Double, unit: String) {
        self.quantity = quantity
        let foundMassUnit : MassUnit? =  {
            for (key,alternativesArray) in AlternativeNamesManager.sharedManager.massNames! {
                for alternative in alternativesArray {
                    if (alternative == unit ) {
                        if let actualMassUnit = MassUnit(rawValue: key) {
                            return actualMassUnit
                            break
                        }
                    }
                }
            }
            return nil
            }()

        if let actualUnit = foundMassUnit  {
            self.unit = actualUnit
        } else {
            return nil
        }

    }
    //
    //    static func convert(mass: Mass, toUnit unit: MassUnit) -> Mass {
    //        return Mass(quantity: mass.quantity * mass.unit.factor / unit.factor, unit: unit)
    //    }
    //
    //    mutating func convert(#toUnit: String) {
    //        self = Mass.convert(self, toUnit: toUnit)
    //    }
    //
    //    func converted(#toUnit: MassUnit) -> Mass {
    //        return Mass.convert(self, toUnit: toUnit)
    //    }
    //
    //    // O(n)
    //    static func fromString(string: String, quantity: Double) -> Mass? {

    //    }
}

//// Not making this a method requirement of `UnitProtocol` means you've only got to
//// write the code once, here, instead of in every enum that conforms to `UnitProtocol`.
func ordersOfMagnitudeFrom<T: UnitProtocol>(unit1: T, to unit2: T) -> Double {
    return unit1.factor - unit2.factor
}

func convert<T: UnitConstruct>(lhs: T, toUnits unit: T.UnitType) -> T {
    let x = Double(ordersOfMagnitudeFrom(lhs.unit, to: unit))
    return T(quantity:lhs.quantity * pow(10, x), unit: unit)
}
//
//// This function is for converting to different units using a `String`,
//// as asked in the OP.
func convert<T: UnitConstruct>(lhs: T, toUnits unit: String) -> T? {
    if let unit = T.UnitType(rawValue: unit) {
        return convert(lhs, toUnits: unit)
    }
    
    return nil
}

extension Mass: Printable {
    var description: String {
        return self.unit.rawValue
    }
}


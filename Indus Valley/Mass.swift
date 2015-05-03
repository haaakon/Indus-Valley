
//  Mass.swift
//  Indus Valley
//
//  Created by Håkon Bogen on 19/04/15.
//  Copyright (c) 2015 haaakon. All rights reserved.
//

import Foundation

struct Mass {

    let quantity : Double
    let unit  : MassUnit

    init(quantity: Double, unit: MassUnit) {
        self.quantity = quantity
        self.unit = unit
    }

    static func convertMass(mass: Mass, toUnit unit: MassUnit) -> Mass {
        return Mass(quantity: mass.quantity * mass.unit.factor / unit.factor, unit: unit)
    }

    mutating func convert(#toUnit: MassUnit) {
        self = Mass.convertMass(self, toUnit: toUnit)
    }

    func converted(#toUnit: MassUnit) -> Mass {
        return Mass.convertMass(self, toUnit: toUnit)
    }

    // O(n)
    static func fromString(string: String, quantity: Double) -> Mass? {
        for (key,alternativesArray) in AlternativeNamesManager.sharedManager.massNames! {
            for alternative in alternativesArray {
                if (alternative == string ) {
                    if let actualMassUnit = MassUnit(rawValue: key) {
                        return Mass(quantity: quantity, unit: actualMassUnit)
                    }
                }
            }
        }
        return nil
    }
}

extension Mass: Printable {
    var description: String {
        return self.unit.rawValue
    }
}

func + (left:Mass, right:Mass) -> Mass {
    let newRightValue = right.converted(toUnit: left.unit)
    return  Mass(quantity: left.quantity + newRightValue.quantity, unit: left.unit)
}

func - (left:Mass, right:Mass) -> Mass {
    let newRightValue = right.converted(toUnit: left.unit)
    return  Mass(quantity: left.quantity - newRightValue.quantity, unit: left.unit)
}
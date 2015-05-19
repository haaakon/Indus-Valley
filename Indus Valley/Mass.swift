
//  Mass.swift
//  Indus Valley
//
//  Created by Håkon Bogen on 19/04/15.
//  Copyright (c) 2015 haaakon. All rights reserved.
//

import Foundation

class Mass : Measurement {

    init(quantity: Double, unit: MassUnit) {
        super.init(quantity: quantity, unit: unit)
    }

    init?(quantity: Double, unit: String) {
        let foundMassUnit : MassUnit? =  {
//            for (key,alternativesArray) in AlternativeNamesManager.sharedManager.massNames! {
//                for alternative in alternativesArray {
//                    if (alternative == unit ) {
//                        if let actualMassUnit = MassUnit(rawValue: key) {
//                            return actualMassUnit
//                        }
//                    }
//                }
//            }
            return nil
            }()

        if let actualUnit = foundMassUnit  {
            super.init(quantity: quantity, unit: actualUnit)
        } else {
            super.init(quantity: -99999, unit: MassUnit.Gram)
            return nil
        }
    }

    required init(quantity: Double, unit: UnitProtocol) {
        super.init(quantity: quantity, unit: unit)
    }
}

//// Not making this a method requirement of `UnitProtocol` means you've only got to
//// write the code once, here, instead of in every enum that conforms to `UnitProtocol`.
func ordersOfMagnitudeFrom<T: UnitProtocol>(unit1: T, to unit2: T) -> Double {
    return unit1.factor - unit2.factor
}

//func convert<T: UnitConstruct>(unit: T, toUnits aUnit: T.UnitType) -> T {
//    let x = Double(ordersOfMagnitudeFrom(unit.unit, to: aUnit))
//    return T(quantity:unit.quantity * pow(10, x), unit: aUnit)
//}
////
////// This function is for converting to different units using a `String`,
////// as asked in the OP.
//func convert<T: UnitConstruct>(lhs: T, toUnits unit: String) -> T? {
//    if let unit = T.UnitType(rawValue: unit) {
//        return convert(lhs, toUnits: unit)
//    }
//    
//    return nil
//}


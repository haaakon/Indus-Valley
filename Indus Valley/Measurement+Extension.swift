// //  Measurement+Extension.swift
//  IndusValley
//
//  Created by Håkon Bogen on 25/06/15.
//  Copyright © 2015 haaakon. All rights reserved.
//

import UIKit

private let subclassNames = [ "ge"]

public extension Measurement {

    mutating func convert(toUnit toUnit: UnitProtocol) {
        self.quantity = self.quantity * self.unit.factor / toUnit.factor
        self.unit = toUnit
    }

    public func unitByConverting(toUnit toUnit: UnitProtocol) -> Measurement {
        let quantity = self.quantity * self.unit.factor / toUnit.factor
        let newMeasurement = self.dynamicType.init(quantity: quantity, unit: toUnit)
        return newMeasurement
    }

    public var longformUnitName : String  {
        let pluralOrSingular : String = {
            if self.quantity == 1 {
                return "SINGULAR"
            }
            return "PLURAL"
            }()
        let key = "\(self.unit.name.uppercaseString)_LONGFORM_\(pluralOrSingular)"
        let localizedName = NSLocalizedString(key, tableName: tableName(), bundle: NSBundle.mainBundle(), comment: "longform name of a measurement")
        return localizedName
    }
}

func ordersOfMagnitudeFrom<T: UnitProtocol>(unit1: T, to unit2: T) -> Double {
    return unit1.factor - unit2.factor
}

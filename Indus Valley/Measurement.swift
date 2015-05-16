//
//  UnitConstruct.swift
//  Indus Valley
//
//  Created by Håkon Bogen on 09/05/15.
//  Copyright (c) 2015 haaakon. All rights reserved.
//

import Foundation

class Measurement {
    
    var quantity: Double
    var unit : UnitProtocol

    required init(quantity: Double, unit: UnitProtocol) {
        self.quantity = quantity
        self.unit = unit
    }

    func convert(#toUnit : UnitProtocol) -> Self {
        let newUnit = self.dynamicType(quantity:  self.quantity * self.unit.factor / toUnit.factor, unit: toUnit)
        return newUnit
    }

}

func +<T: Measurement> (left:T, right:T) -> Measurement {
    let newRightValue  = right.convert(toUnit: left.unit)
    return T(quantity: left.quantity + newRightValue.quantity , unit: left.unit)
}

//func - (left:Mass, right:Mass) -> Mass {
//    let newRightValue = right.converted(toUnit: left.unit)
//    return  Mass(quantity: left.quantity - newRightValue.quantity, unit: left.unit)
//}
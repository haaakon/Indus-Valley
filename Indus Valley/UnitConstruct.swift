//
//  UnitConstruct.swift
//  Indus Valley
//
//  Created by Håkon Bogen on 09/05/15.
//  Copyright (c) 2015 haaakon. All rights reserved.
//

import Foundation

class UnitConstruct {
    
    var quantity: Double
    var unit : UnitProtocol

    init(quantity: Double, unit: UnitProtocol) {
        self.quantity = quantity
        self.unit = unit
    }

    func convert(#toUnit : UnitProtocol) -> UnitConstruct {
        let newUnit = UnitConstruct(quantity:  self.quantity * self.unit.factor / toUnit.factor, unit: toUnit)
        return newUnit
    }

}
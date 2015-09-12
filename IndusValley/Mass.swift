
//  Mass.swift
//  Indus Valley
//
//  Created by Håkon Bogen on 19/04/15.
//  Copyright (c) 2015 haaakon. All rights reserved.
//

import Foundation

public struct Mass : Measurement {

    public var quantity : Double
    public var unit : UnitProtocol

    public func tableName() -> String {
        return "Mass"
    }

    public init(quantity: Double, unit: UnitProtocol) {
        self.quantity = quantity
        self.unit = unit
    }

    public init?(quantity: Double, unit: String) {
        self.quantity = quantity
        if let actualMassUnit = MassUnit(rawValue: unit) {
            self.unit = actualMassUnit
        } else {
            if let mass = measurementFromUnknownUnitWithString(unit, quantity: quantity) as? Mass {
                self.unit = mass.unit
            } else {
                return nil
            }
        }
    }
}


//
//  Measurement.swift
//  Indus Valley
//
//  Created by Håkon Bogen on 19/04/15.
//  Copyright (c) 2015 haaakon. All rights reserved.
//

import Foundation

protocol Measurement {

//    var quantity : Double { get set }
//    var unit : String? { get set }

//    init(quantity: Double, unit: String)

//    static func convert(measurement: Measurement, toUnit unit: String) -> Measurement

    mutating func convert(#toUnit:String)

    //    mutating func convert(#toUnit: MassUnit) {
    //        self = Mass.convertMass(self, toUnit: toUnit)
    //    }
}


//func +<T: Measurement> (left:T, right:T) -> Measurement {
//    let newRightValue  = right.convert(toUnit: left.unit)
//    return T(quantity: left.quantity + newRightValue.quantity , unit: left.unit)
//}

//func - (left:Mass, right:Mass) -> Mass {
//    let newRightValue = right.converted(toUnit: left.unit)
//    return  Mass(quantity: left.quantity - newRightValue.quantity, unit: left.unit)
//}

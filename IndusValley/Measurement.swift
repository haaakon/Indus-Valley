//
//  UnitConstruct.swift
//  Indus Valley
//
//  Created by Håkon Bogen on 09/05/15.
//  Copyright (c) 2015 haaakon. All rights reserved.
//
//

import Foundation

public protocol Measurement {
    
    var quantity: Double { get set }
    var factor : Double { get set }
    var unit : UnitProtocol { get set }

    func tableName() -> String
//    {
//        return "\(self.dynamicType)".componentsSeparatedByString(".")[1]
//    }

    var longformUnitName : String { get }
    //{
//        let aType = self.dynamicType
//        let pluralOrSingular : String = {
//            if self.quantity == 1 {
//                return "SINGULAR"
//            }
//            return "PLURAL"
//        }()
//        let key = "\(self.unit.RawValue.uppercaseString)_LONGFORM_\(pluralOrSingular)"
//        let localizedName = NSLocalizedString(key, tableName: tableName(), bundle: NSBundle(forClass: self.dynamicType), comment: "longform name of a measurement")
//        return localizedName
//    }

     init(quantity: Double, unit: UnitProtocol)
    // {
//        self.quantity = quantity
//        self.unit = unit
//    }

     func unknownUnitWithString(unitString: String?, quantity: Double) -> Measurement?
//    {
//        if unitString == nil {
//            return nil
//        }
//        // find a match in any of the translation files
//        for unitName in subclassNames() {
//            let bundle = NSBundle(forClass: self)
//            if let path = bundle.pathForResource(unitName, ofType: "strings") {
//                let keyValueList = NSDictionary(contentsOfFile: path)
//                if let keys = keyValueList?.allKeysForObject(unitString!) {
//                    let key = keys.first as? String
//                    if let component = key?.componentsSeparatedByString("_").first {
//                        if (unitName.rangeOfString("Mass") != nil) {
//                            return Mass(quantity: quantity, unit: component.lowercaseString)
//                        } else if (unitName.rangeOfString("Volume") != nil) {
//                            return Volume(quantity: quantity, unit: component.lowercaseString)
//                        }
//                    }
//                }
//            }
//        }
//        return nil
//    }

    init?(quantity: Double, unit: String)
    //{
//        let bundle = NSBundle(forClass: self.dynamicType)
//        let tableName = "\(self.dynamicType)".componentsSeparatedByString(".")[1]
//        let path = bundle.pathForResource(tableName, ofType: "strings")
//        let keyValueList = NSDictionary(contentsOfFile: path!)
//        let unit : UnitProtocol? = {
//            if let keys = keyValueList?.allKeysForObject(unit) {
//                let key = keys.first as? String
//                if let component = key?.componentsSeparatedByString("_").first {
//                    if (tableName.rangeOfString("Mass") != nil) {
//                        return MassUnit(rawValue: component.lowercaseString)
//                    }else if (tableName.rangeOfString("Volume") != nil) {
//                        return VolumeUnit(rawValue: component.lowercaseString)
//                    }
//                }
//            }
//            return nil
//        }()
//        self.quantity = quantity
//        if let actualUnit = unit {
//            self.unit = actualUnit
//        } else {
//            self.unit = MassUnit(rawValue: "kg")!
//            return nil
//        }
//    }

    static func subclassNames() -> [String]
//    {
//        return ["Mass", "Volume"]
//    }
//
    func convert(toUnit toUnit : UnitProtocol) -> Self
//    v{
//        let newUnit = self.dynamicType.init(quantity:  self.quantity * self.unit.factor / toUnit.factor, unit: toUnit)
//        return newUnit
//    }
}

func +<T: Measurement> (left:T, right:T) -> Measurement {
    let newRightValue  = right.convert(toUnit: left.unit)
    return T(quantity: left.quantity + newRightValue.quantity , unit: left.unit)
}

//func - (left:Mass, right:Mass) -> Mass {
//    let newRightValue = right.converted(toUnit: left.unit)
//    return  Mass(quantity: left.quantity - newRightValue.quantity, unit: left.unit)
//}
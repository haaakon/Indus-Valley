// //  Measurement+Extension.swift
//  IndusValley
//
//  Created by Håkon Bogen on 25/06/15.
//  Copyright © 2015 haaakon. All rights reserved.
//

import UIKit

private let subclassNames = [ "ge"]

extension Measurement {

//    public static func subclassNames() -> [String] {
//        return ["Mass", "Volume"]
//    }


    public func unknownUnitWithString(unitString: String?, quantity: Double) -> Measurement? {
        if unitString == nil {
            return nil
        }

        // find a match in any of the translation files

        for unitName in ["Mass", "Volume"] {
            let bundle = NSBundle(forClass: NSObject.self)
            if let path = bundle.pathForResource(unitName, ofType: "strings") {
                let keyValueList = NSDictionary(contentsOfFile: path)
                if let keys = keyValueList?.allKeysForObject(unitString!) {
                    let key = keys.first as? String
                    if let component = key?.componentsSeparatedByString("_").first {
                        if (unitName.rangeOfString("Mass") != nil) {
//                            return Mass(quantity: quantity, unit: component.lowercaseString)
                        } else if (unitName.rangeOfString("Volume") != nil) {
//                            return Volume(quantity: quantity, unit: component.lowercaseString)
                        }
                    }
                }
            }
        }
        return nil
    }

    var longformUnitName : String  {
        let aType = self.dynamicType
        let pluralOrSingular : String = {
            if self.quantity == 1 {
                return "SINGULAR"
            }
            return "PLURAL"
            }()
        let key = "\(self.unit.RawValue.uppercaseString)_LONGFORM_\(pluralOrSingular)"
        let localizedName = NSLocalizedString(key, tableName: tableName(), bundle: NSBundle.mainBundle(), comment: "longform name of a measurement")
        return localizedName
    }

    init(quantity: Double, unit: UnitProtocol) {
//        self.quantity = quantity
//        self.unit = unit
    }

    init?(quantity: Double, unit: String) {
        let bundle = NSBundle(forClass: NSObject.self)
        let tableName = "\(NSObject.self)".componentsSeparatedByString(".")[1]
        let path = bundle.pathForResource(tableName, ofType: "strings")
        let keyValueList = NSDictionary(contentsOfFile: path!)
        let unit : UnitProtocol? = {
            if let keys = keyValueList?.allKeysForObject(unit) {
                let key = keys.first as? String
                if let component = key?.componentsSeparatedByString("_").first {
                    if (tableName.rangeOfString("Mass") != nil) {
                        return MassUnit(rawValue: component.lowercaseString)
                    }else if (tableName.rangeOfString("Volume") != nil) {
                        return VolumeUnit(rawValue: component.lowercaseString)
                    }
                }
            }
            return nil
            }()
//        self.quantity = quantity
        if let actualUnit = unit {
//            self.unit = actualUnit
        } else {
//            self.unit = MassUnit(rawValue: "kg")!
            return nil
        }

    }

//    init?(quantity: Double, unit: String)
//    {
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
//

//    func unknownUnitWithString(unitString: String?, quantity: Double) -> Measurement? {
//        if unitString == nil {
//                return nil
//        }
//        // find a match in any of the translation files
//        for unitName in subclassNames {
//            let bundle = NSBundle(forClass: NSString.self)
//            if let path = bundle.pathForResource(unitName, ofType: "strings") {
//                let keyValueList = NSDictionary(contentsOfFile: path)
//                if let keys = keyValueList?.allKeysForObject(unitString!) {
//                    let key = keys.first as? String
//                    if let component = key?.componentsSeparatedByString("_").first {
//                        if (unitName.rangeOfString("Mass") != nil) {
////                            return Mass(quantity: quantity, unit: component.lowercaseString)
//                        } else if (unitName.rangeOfString("Volume") != nil) {
////                            return Volume(quantity: quantity, unit: component.lowercaseString)
//                        }
//                    }
//                }
//            }
//        }
//        return nil
//    }
}

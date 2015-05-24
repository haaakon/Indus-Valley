//
//  UnitType.swift
//  TomeOfRecipes
//
//  Created by Håkon Bogen on 13/04/15.
//  Copyright (c) 2015 haaakon. All rights reserved.
//

import Foundation

// SI units
public enum MassUnit : String, UnitProtocol {

    case Milligram   =        "mg"
    case Gram        =        "g"
    case Ounce       =        "oz"
    case Pound       =        "lb"
    case Kilo        =        "kg"
    case Ton         =        "t"


    public var factor: Double {
        return  {
            switch self {
            case .Milligram:  return         0.001
            case .Gram:       return         1.0
            case .Ounce:      return        28.3495231
            case .Pound:      return       453.59237
            case .Kilo:       return      1000.0
            case .Ton:        return   1000000.0
            }
            }()
    }

    var alternativeNames : [String]? {
        return {
            self.alternativeStrings(self.rawValue)
        }()

    }

    private func alternativeStrings(key: String) -> [String]? {
        let alternatives = NSLocalizedString(self.rawValue, tableName: "", bundle: NSBundle.mainBundle(), value: "", comment: "")
        let separatedAlternatives = alternatives.componentsSeparatedByString(",")
        return separatedAlternatives
    }

    static func allValues() {
        var values = [MassUnit]()
    }

}

func == (lhs: MassUnit?, rhs : UnitProtocol?) -> Bool {
    return lhs?.rawValue == rhs?.rawValue
}
func == (lhs: UnitProtocol?, rhs : MassUnit?) -> Bool {
    return lhs?.rawValue == rhs?.rawValue
}

extension MassUnit: Printable {
    public var description: String {
        return self.rawValue
    }
}
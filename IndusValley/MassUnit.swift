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

    case Unknown     =        "unknown"
    case Milligram   =        "mg"
    case Gram        =        "g"
    case Ounce       =        "oz"
    case Pound       =        "lb"
    case Kilo        =        "kg"
    case Ton         =        "t"

    public var name : String {
        return self.rawValue
    }

    public var factor: Double {
        return  {
            switch self {
            case .Milligram:  return         0.001
            case .Gram:       return         1.0
            case .Ounce:      return        28.3495231
            case .Pound:      return       453.59237
            case .Kilo:       return      1000.0
            case .Ton:        return   1000000.0
            case Unknown:     return         0.0
            }
            }()

    }
}

extension MassUnit: CustomStringConvertible {
    public var description: String {
        return self.rawValue
    }
}
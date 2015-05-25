//
//  VolumeUnit.swift
//  Indus Valley
//
//  Created by Håkon Bogen on 19/04/15.
//  Copyright (c) 2015 haaakon. All rights reserved.
//

import Foundation

public enum VolumeUnit : String, UnitProtocol {

    case Milliliter      =         "ml"
    case Gram      =               "g"
    case Tablespoon      =         "tbsp"
    case Litre           =         "l"

    public var factor : Double {
        return {
            switch self {
            case Milliliter:       return               1.0
            case Gram:             return               1.0   // gram in volume equals 1 ml
            case Tablespoon:       return              15.0
            case Litre:            return            1000.0
            }

            }()
    }
}

func == (lhs: VolumeUnit?, rhs : UnitProtocol?) -> Bool {
    return lhs?.rawValue == rhs?.rawValue
}

func == (lhs: UnitProtocol?, rhs : VolumeUnit?) -> Bool {
    return lhs?.rawValue == rhs?.rawValue
}
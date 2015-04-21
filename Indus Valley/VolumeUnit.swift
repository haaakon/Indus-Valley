//
//  VolumeUnit.swift
//  Indus Valley
//
//  Created by Håkon Bogen on 19/04/15.
//  Copyright (c) 2015 haaakon. All rights reserved.
//

import Foundation

enum VolumeUnit : String {

    case Millilitre      =         "ml"
    case Tablespoon      =         "tbsp"
    case Litre           =         "l"

    var factor : Double {
        return {
            switch self {
            case Millilitre:       return             1.0
            case Tablespoon:       return            15.0
            case Litre:            return          1000.0
            }

            }()
    }
}
//
//  Volume.swift
//  Indus Valley
//
//  Created by Håkon Bogen on 19/04/15.
//  Copyright (c) 2015 haaakon. All rights reserved.
//

import Foundation

public class Volume : Measurement {

    public init(quantity: Double, unit: VolumeUnit) {
        super.init(quantity: quantity, unit: unit)
    }

    required public init(quantity: Double, unit: UnitProtocol) {
        super.init(quantity: quantity, unit: unit)
    }

    required public init?(quantity: Double, unit: String) {
        super.init(quantity: quantity, unit: unit)
    }
}

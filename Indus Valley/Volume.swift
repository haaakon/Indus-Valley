//
//  Volume.swift
//  Indus Valley
//
//  Created by Håkon Bogen on 19/04/15.
//  Copyright (c) 2015 haaakon. All rights reserved.
//

import Foundation

struct Volume {

    let quantity : Double
    let unit  : VolumeUnit

    init(quantity: Double, unit: VolumeUnit) {
        self.quantity = quantity
        self.unit = unit
    }

}
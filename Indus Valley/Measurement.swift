//
//  Measurement.swift
//  Indus Valley
//
//  Created by Håkon Bogen on 19/04/15.
//  Copyright (c) 2015 haaakon. All rights reserved.
//

import Foundation


protocol Measurement {
    var quantity: Double { get set }
    var unit: String { get set }
}
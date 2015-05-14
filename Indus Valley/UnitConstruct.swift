//
//  UnitConstruct.swift
//  Indus Valley
//
//  Created by Håkon Bogen on 09/05/15.
//  Copyright (c) 2015 haaakon. All rights reserved.
//

import Foundation

protocol UnitConstruct {
    
    typealias UnitType: UnitProtocol

    var quantity: Double   { get }
    var unit  : UnitType { get }

    init(quantity: Double, unit: UnitType)

    init?(quantity: Double, unit: String)

}
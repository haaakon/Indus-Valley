//
//  UnitProtocol.swift
//  Indus Valley
//
//  Created by Håkon Bogen on 09/05/15.
//  Copyright (c) 2015 haaakon. All rights reserved.
//

import Foundation

typealias UnitType = UnitProtocol

protocol UnitProtocol  {

    var rawValue : String { get }
    var factor: Double { get }
    init?(rawValue: String)
    
}




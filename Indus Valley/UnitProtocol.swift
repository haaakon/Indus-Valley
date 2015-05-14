//
//  UnitProtocol.swift
//  Indus Valley
//
//  Created by Håkon Bogen on 09/05/15.
//  Copyright (c) 2015 haaakon. All rights reserved.
//

import Foundation

protocol UnitProtocol {

    var factor: Double { get }
    init?(rawValue: String)
    
}




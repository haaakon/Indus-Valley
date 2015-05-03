//
//  AlternativeNamesManager.swift
//  Indus Valley
//
//  Created by Håkon Bogen on 20/04/15.
//  Copyright (c) 2015 haaakon. All rights reserved.
//

import Foundation

private let _alternativeNamesManagerManagerSharedInstance = AlternativeNamesManager()

// TODO Make a binary search tree for quick lookup
class AlternativeNamesManager {

    class var sharedManager: AlternativeNamesManager {
        return _alternativeNamesManagerManagerSharedInstance
    }

    lazy var massNames: [String : [String]]? = {
        let bundle = NSBundle(forClass: self.dynamicType)
        let path = bundle.pathForResource("MassAlternativeNames", ofType: "json")
        let data = NSData(contentsOfFile: path!)
        var error : NSError?
        let jsonDictionary = NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.AllowFragments, error: &error) as? [String : [String]]

        if let error = error {
            return nil
        }

        return jsonDictionary
        }()



}
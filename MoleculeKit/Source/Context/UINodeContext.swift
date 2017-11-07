//
//  UINodeContext.swift
//  MoleculeKit
//
//  Created by Topic, Zdenek on 02/11/2017.
//  Copyright © 2017 Zdenek Topic. All rights reserved.
//

import Foundation

@objc open class UINodeContext: NSObject {
    
    var isNew: Bool = true
    let reuseIdentifier: String
    
    public init(reuseIdentifier: String) {
        self.reuseIdentifier = reuseIdentifier
        super.init()
    }
    
}

//
//  UINodeIdentifiable.swift
//  MoleculeKit
//
//  Created by Topic, Zdenek on 01/11/2017.
//  Copyright © 2017 Zdenek Topic. All rights reserved.
//

import Foundation

public protocol UINodeIdentifiable {
    
    var reuseIdentifier: String { get }
    
}

extension String: UINodeIdentifiable {
    
    public var reuseIdentifier: String {
        return self
    }
    
}

//
//  View+Context.swift
//  MoleculeKit
//
//  Created by Topic, Zdenek on 02/11/2017.
//  Copyright © 2017 Zdenek Topic. All rights reserved.
//

import Foundation

fileprivate var nodeContextKey = "_nodeContext"

extension View: AssociatedObjectStoring {
    
    internal var _nodeContext: UINodeContext? {
        get {
            return associatedObject(forKey: &nodeContextKey)
        }
        set {
            setAssociatedObject(newValue, forKey: &nodeContextKey)
        }
    }
    
}

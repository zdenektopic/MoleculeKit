//
//  UIRenderable.swift
//  MoleculeKit
//
//  Created by Topic, Zdenek on 05/11/2017.
//  Copyright © 2017 Zdenek Topic. All rights reserved.
//

import Foundation

public protocol UIRenderable {
    
    func didLayout()
    
}

public extension UIRenderable {
    
    public func willLayout() {}
    public func didLayout() {}
    
}

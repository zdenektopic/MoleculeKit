//
//  UIComponentProps.swift
//  MoleculeKit
//
//  Created by Topic, Zdenek on 01/11/2017.
//  Copyright © 2017 Zdenek Topic. All rights reserved.
//

import Foundation

public protocol UIComponentProps: EmptyInitializable, Codable {}

public struct UINoProps: UIComponentProps {
    
    public init() {}
    
}

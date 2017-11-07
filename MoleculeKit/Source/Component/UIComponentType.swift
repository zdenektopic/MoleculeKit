//
//  UIComponentType.swift
//  MoleculeKit
//
//  Created by Topic, Zdenek on 02/11/2017.
//  Copyright © 2017 Zdenek Topic. All rights reserved.
//

import Foundation

public protocol UIComponentType {
    
    var intrinsicContentSize: CGSize { get }
    
    func mount(in: View?)
    func update()
    func layout()
    func sizeThatFits(_ size: CGSize) -> CGSize
    
}

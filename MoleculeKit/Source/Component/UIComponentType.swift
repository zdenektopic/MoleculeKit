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
    var needsLayout: Bool { get }
    
    func mount(in: View)
    func layout()
    func layoutIfNeeded()
    func setNeedsLayout()
    
}

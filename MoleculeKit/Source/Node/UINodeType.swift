//
//  UINodeType.swift
//  MoleculeKit
//
//  Created by Topic, Zdenek on 01/11/2017.
//  Copyright © 2017 Zdenek Topic. All rights reserved.
//

import Foundation

public protocol UINodeType {
    
    var reuseIdentifier: String { get }
    var renderedView: View? { get }
    
    func reconcile(with: View?, currentIndex: Int?, in: View, toIndex: Int)
    func setup(size: CGSize)
    
}

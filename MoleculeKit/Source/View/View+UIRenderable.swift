//
//  View+UIRenderable.swift
//  MoleculeKit
//
//  Created by Topic, Zdenek on 05/11/2017.
//  Copyright © 2017 Zdenek Topic. All rights reserved.
//

import Foundation
import UIKit

extension UIScrollView: UIRenderable {
    
    public func postRender() {
        assert(Thread.isMainThread)
        
        if self is UITableView { return }
        if self is UICollectionView { return }
        var x: CGFloat = 0
        var y: CGFloat = 0
        for subview in self.subviews {
            x = subview.frame.maxX > x ? subview.frame.maxX : x
            y = subview.frame.maxY > y ? subview.frame.maxY : y
        }
        
        if self.yoga.flexDirection == .column {
            self.contentSize = CGSize(width: self.contentSize.width, height: y)
        } else {
            self.contentSize = CGSize(width: x, height: self.contentSize.height)
        }
        
        self.isScrollEnabled = true
    }
    
}

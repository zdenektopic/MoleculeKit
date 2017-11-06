//
//  UIComponentView.swift
//  MoleculeKit
//
//  Created by Topic, Zdenek on 02/11/2017.
//  Copyright © 2017 Zdenek Topic. All rights reserved.
//

import Foundation
import UIKit

open class UIComponentView<ComponentType: UIComponentType>: UIView {
    
    open let component: ComponentType
    
    public init(_ component: ComponentType) {
        self.component = component
        super.init(frame: .zero)
        
        component.mount(in: self)
    }
    
    open override func layoutSubviews() {
        super.layoutSubviews()
        component.layout()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    open override var intrinsicContentSize: CGSize {
        return component.intrinsicContentSize
    }
    
    open override func sizeThatFits(_ size: CGSize) -> CGSize {
        return intrinsicContentSize
    }
    
    open override func setNeedsLayout() {
        super.setNeedsLayout()
        print("NEEDS LAYOUT")
    }
    
}

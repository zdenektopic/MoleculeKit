//
//  ListTableComponent.swift
//  MoleculeKitExample
//
//  Created by Topic, Zdenek on 01/11/2017.
//  Copyright © 2017 Zdenek Topic. All rights reserved.
//

import Foundation
import MoleculeKit
import UIKit

struct ListTable: UIComponentState {
    
    init() {
        
    }
    
}

struct ListTableProps: UIComponentProps {
    
    var headerTitle: String?
    
    init() {
    }
    
}

extension UIComponent where PropsType == ListTableProps {
    
    var headerTitle: String? {
        get {
            return self.props.headerTitle
        }
        set {
            self.props.headerTitle = newValue
        }
    }
    
}

final class ListTableComponent: UIComponent<ListTable, ListTableProps> {
    
    enum NodeIdentifier: String, UINodeIdentifiable {
        var reuseIdentifier: String { return rawValue }
        
        case container
        case label
    }
    
    override init() {
        super.init()
    }
    
    override func render(state: ListTable, props: ListTableProps) -> UINodeType {
        return UINode<UIView>(reuseIdentifier:  NodeIdentifier.container)
            .configure { view, layout, _ in
                layout.flexDirection = .column
                layout.width = 50%
                layout.height = 50%
                view.backgroundColor = .lightGray
            }
            .children([
                UINode<UILabel>(reuseIdentifier: "label-1") { label, _, _ in label.text = "prvni" },
                UINode<UILabel>(reuseIdentifier: "label-2") { label, _, _ in label.text = "druhy" },
                UINode<UILabel>(reuseIdentifier: "label-3") { label, _, _ in label.text = "treti" }
            ])
    }
    
    override func didLayout() {
        super.didLayout()
        print("didLayout")
    }
    
    override func didReconcile() {
        super.didReconcile()
        print("didReconcile")
    }
    
    override func didUpdateProps() {
        super.didUpdateProps()
        print("didUpdateProps")
    }
    
    override func didUpdateState() {
        super.didUpdateState()
        print("didUpdateState")
    }
    
    override func didMount(in view: UIView) {
        super.didMount(in: view)
    }
    
}

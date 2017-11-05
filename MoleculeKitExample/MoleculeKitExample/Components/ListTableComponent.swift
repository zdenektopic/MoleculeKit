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
                UINode<UILabel>(reuseIdentifier: "label-3") { label, _, _ in label.text = "treti" },
                UINode<UILabel>(reuseIdentifier: "label-4") { label, _, _ in label.text = "ctvrty" },
                UINode<UILabel>(reuseIdentifier: "label-5") { label, _, _ in label.text = "paty" },
                UINode<UILabel>(reuseIdentifier: "label-6") { label, _, _ in label.text = "sesty" },
                UINode<UILabel>(reuseIdentifier: "label-7") { label, _, _ in label.text = "prvni" },
                UINode<UILabel>(reuseIdentifier: "label-8") { label, _, _ in label.text = "druhy" },
                UINode<UILabel>(reuseIdentifier: "label-9") { label, _, _ in label.text = "treti" },
                UINode<UILabel>(reuseIdentifier: "label-10") { label, _, _ in label.text = "ctvrty" },
                UINode<UILabel>(reuseIdentifier: "label-11") { label, _, _ in label.text = "paty" },
                UINode<UILabel>(reuseIdentifier: "label-12") { label, _, _ in label.text = "sesty" },
                
                UINode<UILabel>(reuseIdentifier: "label-21") { label, _, _ in label.text = "prvni" },
                UINode<UILabel>(reuseIdentifier: "label-22") { label, _, _ in label.text = "druhy" },
                UINode<UILabel>(reuseIdentifier: "label-23") { label, _, _ in label.text = "treti" },
                UINode<UILabel>(reuseIdentifier: "label-24") { label, _, _ in label.text = "ctvrty" },
                UINode<UILabel>(reuseIdentifier: "label-25") { label, _, _ in label.text = "paty" },
                UINode<UILabel>(reuseIdentifier: "label-26") { label, _, _ in label.text = "sesty" },
                UINode<UILabel>(reuseIdentifier: "label-27") { label, _, _ in label.text = "prvni" },
                UINode<UILabel>(reuseIdentifier: "label-28") { label, _, _ in label.text = "druhy" },
                UINode<UILabel>(reuseIdentifier: "label-29") { label, _, _ in label.text = "treti" },
                UINode<UILabel>(reuseIdentifier: "label-210") { label, _, _ in label.text = "ctvrty" },
                UINode<UILabel>(reuseIdentifier: "label-211") { label, _, _ in label.text = "paty" },
                UINode<UILabel>(reuseIdentifier: "label-212") { label, _, _ in label.text = "sesty" }
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

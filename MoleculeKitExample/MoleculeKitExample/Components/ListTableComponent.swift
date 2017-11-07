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
        return UINode<UIScrollView>(reuseIdentifier:  NodeIdentifier.container)
            .configure { view, layout, size in
                layout.flexDirection = .column
                layout.width = 100%
                layout.height = 100%
                layout.overflow = .scroll
                view.backgroundColor = .lightGray
            }
            .children([
                UINode<UILabel>(reuseIdentifier: "label-1") { label, _, _ in
                    label.text = "prvni"
                    label.font = UIFont.boldSystemFont(ofSize: 12)
                    label.textColor = .red
                    label.textAlignment = .center
                },
                UINode<UILabel>(reuseIdentifier: "label-2") { label, _, _ in
                    label.text = "prvni"
                    label.font = UIFont.boldSystemFont(ofSize: 12)
                    label.textColor = .red
                    label.textAlignment = .center
                },
                UINode<UILabel>(reuseIdentifier: "label-3") { label, _, _ in
                    label.text = "prvni"
                    label.font = UIFont.boldSystemFont(ofSize: 12)
                    label.textColor = .red
                    label.textAlignment = .center
                },
                UINode<UILabel>(reuseIdentifier: "label-4") { label, _, _ in
                    label.text = "prvni"
                    label.font = UIFont.boldSystemFont(ofSize: 12)
                    label.textColor = .red
                    label.textAlignment = .center
                },
                UINode<UILabel>(reuseIdentifier: "label-5") { label, _, _ in
                    label.text = "prvni"
                    label.font = UIFont.boldSystemFont(ofSize: 12)
                    label.textColor = .red
                    label.textAlignment = .center
                },
                UINode<UILabel>(reuseIdentifier: "label-6") { label, _, _ in
                    label.text = "prvni"
                    label.font = UIFont.boldSystemFont(ofSize: 12)
                    label.textColor = .red
                    label.textAlignment = .center
                },
                UINode<UILabel>(reuseIdentifier: "label-7") { label, _, _ in
                    label.text = "prvni"
                    label.font = UIFont.boldSystemFont(ofSize: 12)
                    label.textColor = .red
                    label.textAlignment = .center
                },
                UINode<UILabel>(reuseIdentifier: "label-8") { label, _, _ in
                    label.text = "prvni"
                    label.font = UIFont.boldSystemFont(ofSize: 12)
                    label.textColor = .red
                    label.textAlignment = .center
                },
                UINode<UILabel>(reuseIdentifier: "label-9") { label, _, _ in
                    label.text = "prvni"
                    label.font = UIFont.boldSystemFont(ofSize: 12)
                    label.textColor = .red
                    label.textAlignment = .center
                },
                UINode<UILabel>(reuseIdentifier: "label-10") { label, _, _ in
                    label.text = "prvni"
                    label.font = UIFont.boldSystemFont(ofSize: 12)
                    label.textColor = .red
                    label.textAlignment = .center
                },
                UINode<UILabel>(reuseIdentifier: "label-11") { label, _, _ in
                    label.text = "prvni"
                    label.font = UIFont.boldSystemFont(ofSize: 12)
                    label.textColor = .red
                    label.textAlignment = .center
                },
                UINode<UILabel>(reuseIdentifier: "label-12") { label, _, _ in
                    label.text = "prvni"
                    label.font = UIFont.boldSystemFont(ofSize: 12)
                    label.textColor = .red
                    label.textAlignment = .center
                },
                
                UINode<UILabel>(reuseIdentifier: "label-1") { label, _, _ in
                    label.text = "prvni"
                    label.font = UIFont.boldSystemFont(ofSize: 12)
                    label.textColor = .red
                    label.textAlignment = .center
                },
                UINode<UILabel>(reuseIdentifier: "label-2") { label, _, _ in
                    label.text = "prvni"
                    label.font = UIFont.boldSystemFont(ofSize: 12)
                    label.textColor = .red
                    label.textAlignment = .center
                },
                UINode<UILabel>(reuseIdentifier: "label-3") { label, _, _ in
                    label.text = "prvni"
                    label.font = UIFont.boldSystemFont(ofSize: 12)
                    label.textColor = .red
                    label.textAlignment = .center
                },
                UINode<UILabel>(reuseIdentifier: "label-4") { label, _, _ in
                    label.text = "prvni"
                    label.font = UIFont.boldSystemFont(ofSize: 12)
                    label.textColor = .red
                    label.textAlignment = .center
                },
                UINode<UILabel>(reuseIdentifier: "label-5") { label, _, _ in
                    label.text = "prvni"
                    label.font = UIFont.boldSystemFont(ofSize: 12)
                    label.textColor = .red
                    label.textAlignment = .center
                },
                UINode<UILabel>(reuseIdentifier: "label-6") { label, _, _ in
                    label.text = "prvni"
                    label.font = UIFont.boldSystemFont(ofSize: 12)
                    label.textColor = .red
                    label.textAlignment = .center
                },
                UINode<UILabel>(reuseIdentifier: "label-7") { label, _, _ in
                    label.text = "prvni"
                    label.font = UIFont.boldSystemFont(ofSize: 12)
                    label.textColor = .red
                    label.textAlignment = .center
                },
                UINode<UILabel>(reuseIdentifier: "label-8") { label, _, _ in
                    label.text = "prvni"
                    label.font = UIFont.boldSystemFont(ofSize: 12)
                    label.textColor = .red
                    label.textAlignment = .center
                },
                UINode<UILabel>(reuseIdentifier: "label-9") { label, _, _ in
                    label.text = "prvni"
                    label.font = UIFont.boldSystemFont(ofSize: 12)
                    label.textColor = .red
                    label.textAlignment = .center
                },
                UINode<UILabel>(reuseIdentifier: "label-10") { label, _, _ in
                    label.text = "prvni"
                    label.font = UIFont.boldSystemFont(ofSize: 12)
                    label.textColor = .red
                    label.textAlignment = .center
                },
                UINode<UILabel>(reuseIdentifier: "label-11") { label, _, _ in
                    label.text = "prvni"
                    label.font = UIFont.boldSystemFont(ofSize: 12)
                    label.textColor = .red
                    label.textAlignment = .center
                },
                UINode<UILabel>(reuseIdentifier: "label-12") { label, _, _ in
                    label.text = "prvni"
                    label.font = UIFont.boldSystemFont(ofSize: 12)
                    label.textColor = .red
                    label.textAlignment = .center
                },
                
                UINode<UILabel>(reuseIdentifier: "label-1") { label, _, _ in
                    label.text = "prvni"
                    label.font = UIFont.boldSystemFont(ofSize: 12)
                    label.textColor = .red
                    label.textAlignment = .center
                },
                UINode<UILabel>(reuseIdentifier: "label-2") { label, _, _ in
                    label.text = "prvni"
                    label.font = UIFont.boldSystemFont(ofSize: 12)
                    label.textColor = .red
                    label.textAlignment = .center
                },
                UINode<UILabel>(reuseIdentifier: "label-3") { label, _, _ in
                    label.text = "prvni"
                    label.font = UIFont.boldSystemFont(ofSize: 12)
                    label.textColor = .red
                    label.textAlignment = .center
                },
                UINode<UILabel>(reuseIdentifier: "label-4") { label, _, _ in
                    label.text = "prvni"
                    label.font = UIFont.boldSystemFont(ofSize: 12)
                    label.textColor = .red
                    label.textAlignment = .center
                },
                UINode<UILabel>(reuseIdentifier: "label-5") { label, _, _ in
                    label.text = "prvni"
                    label.font = UIFont.boldSystemFont(ofSize: 12)
                    label.textColor = .red
                    label.textAlignment = .center
                },
                UINode<UILabel>(reuseIdentifier: "label-6") { label, _, _ in
                    label.text = "prvni"
                    label.font = UIFont.boldSystemFont(ofSize: 12)
                    label.textColor = .red
                    label.textAlignment = .center
                },
                UINode<UILabel>(reuseIdentifier: "label-7") { label, _, _ in
                    label.text = "prvni"
                    label.font = UIFont.boldSystemFont(ofSize: 12)
                    label.textColor = .red
                    label.textAlignment = .center
                },
                UINode<UILabel>(reuseIdentifier: "label-8") { label, _, _ in
                    label.text = "prvni"
                    label.font = UIFont.boldSystemFont(ofSize: 12)
                    label.textColor = .red
                    label.textAlignment = .center
                },
                UINode<UILabel>(reuseIdentifier: "label-9") { label, _, _ in
                    label.text = "prvni"
                    label.font = UIFont.boldSystemFont(ofSize: 12)
                    label.textColor = .red
                    label.textAlignment = .center
                },
                UINode<UILabel>(reuseIdentifier: "label-10") { label, _, _ in
                    label.text = "prvni"
                    label.font = UIFont.boldSystemFont(ofSize: 12)
                    label.textColor = .red
                    label.textAlignment = .center
                },
                UINode<UILabel>(reuseIdentifier: "label-11") { label, _, _ in
                    label.text = "prvni"
                    label.font = UIFont.boldSystemFont(ofSize: 12)
                    label.textColor = .red
                    label.textAlignment = .center
                },
                UINode<UILabel>(reuseIdentifier: "label-12") { label, _, _ in
                    label.text = "prvni"
                    label.font = UIFont.boldSystemFont(ofSize: 12)
                    label.textColor = .red
                    label.textAlignment = .center
                },
                
                UINode<UILabel>(reuseIdentifier: "label-1") { label, _, _ in
                    label.text = "prvni"
                    label.font = UIFont.boldSystemFont(ofSize: 12)
                    label.textColor = .red
                    label.textAlignment = .center
                },
                UINode<UILabel>(reuseIdentifier: "label-2") { label, _, _ in
                    label.text = "prvni"
                    label.font = UIFont.boldSystemFont(ofSize: 12)
                    label.textColor = .red
                    label.textAlignment = .center
                },
                UINode<UILabel>(reuseIdentifier: "label-3") { label, _, _ in
                    label.text = "prvni"
                    label.font = UIFont.boldSystemFont(ofSize: 12)
                    label.textColor = .red
                    label.textAlignment = .center
                },
                UINode<UILabel>(reuseIdentifier: "label-4") { label, _, _ in
                    label.text = "prvni"
                    label.font = UIFont.boldSystemFont(ofSize: 12)
                    label.textColor = .red
                    label.textAlignment = .center
                },
                UINode<UILabel>(reuseIdentifier: "label-5") { label, _, _ in
                    label.text = "prvni"
                    label.font = UIFont.boldSystemFont(ofSize: 12)
                    label.textColor = .red
                    label.textAlignment = .center
                },
                UINode<UILabel>(reuseIdentifier: "label-6") { label, _, _ in
                    label.text = "prvni"
                    label.font = UIFont.boldSystemFont(ofSize: 12)
                    label.textColor = .red
                    label.textAlignment = .center
                },
                UINode<UILabel>(reuseIdentifier: "label-7") { label, _, _ in
                    label.text = "prvni"
                    label.font = UIFont.boldSystemFont(ofSize: 12)
                    label.textColor = .red
                    label.textAlignment = .center
                },
                UINode<UILabel>(reuseIdentifier: "label-8") { label, _, _ in
                    label.text = "prvni"
                    label.font = UIFont.boldSystemFont(ofSize: 12)
                    label.textColor = .red
                    label.textAlignment = .center
                },
                UINode<UILabel>(reuseIdentifier: "label-9") { label, _, _ in
                    label.text = "prvni"
                    label.font = UIFont.boldSystemFont(ofSize: 12)
                    label.textColor = .red
                    label.textAlignment = .center
                },
                UINode<UILabel>(reuseIdentifier: "label-10") { label, _, _ in
                    label.text = "prvni"
                    label.font = UIFont.boldSystemFont(ofSize: 12)
                    label.textColor = .red
                    label.textAlignment = .center
                },
                UINode<UILabel>(reuseIdentifier: "label-11") { label, _, _ in
                    label.text = "prvni"
                    label.font = UIFont.boldSystemFont(ofSize: 12)
                    label.textColor = .red
                    label.textAlignment = .center
                },
                UINode<UILabel>(reuseIdentifier: "label-12") { label, _, _ in
                    label.text = "prvni"
                    label.font = UIFont.boldSystemFont(ofSize: 12)
                    label.textColor = .red
                    label.textAlignment = .center
                },
                
                UINode<UILabel>(reuseIdentifier: "label-1") { label, _, _ in
                    label.text = "prvni"
                    label.font = UIFont.boldSystemFont(ofSize: 12)
                    label.textColor = .red
                    label.textAlignment = .center
                },
                UINode<UILabel>(reuseIdentifier: "label-2") { label, layout, _ in
                    layout.alignSelf = .flexEnd
                    label.text = "prvni"
                    label.font = UIFont.boldSystemFont(ofSize: 12)
                    label.textColor = .red
                    label.textAlignment = .center
                },
                UINode<UILabel>(reuseIdentifier: "label-3") { label, _, _ in
                    label.text = "prvni"
                    label.font = UIFont.boldSystemFont(ofSize: 12)
                    label.textColor = .red
                    label.textAlignment = .center
                },
                UINode<UILabel>(reuseIdentifier: "label-4") { label, _, _ in
                    label.text = "prvni"
                    label.font = UIFont.boldSystemFont(ofSize: 12)
                    label.textColor = .red
                    label.textAlignment = .center
                },
                UINode<UILabel>(reuseIdentifier: "label-5") { label, _, _ in
                    label.text = "prvni"
                    label.font = UIFont.boldSystemFont(ofSize: 12)
                    label.textColor = .red
                    label.textAlignment = .center
                },
                UINode<UILabel>(reuseIdentifier: "label-6") { label, _, _ in
                    label.text = "prvni"
                    label.font = UIFont.boldSystemFont(ofSize: 12)
                    label.textColor = .red
                    label.textAlignment = .center
                },
                UINode<UILabel>(reuseIdentifier: "label-7") { label, _, _ in
                    label.text = "prvni"
                    label.font = UIFont.boldSystemFont(ofSize: 12)
                    label.textColor = .red
                    label.textAlignment = .center
                },
                UINode<UILabel>(reuseIdentifier: "label-8") { label, _, _ in
                    label.text = "prvni"
                    label.font = UIFont.boldSystemFont(ofSize: 12)
                    label.textColor = .red
                    label.textAlignment = .center
                },
                UINode<UILabel>(reuseIdentifier: "label-9") { label, _, _ in
                    label.text = "prvni"
                    label.font = UIFont.boldSystemFont(ofSize: 12)
                    label.textColor = .red
                    label.textAlignment = .center
                },
                UINode<UILabel>(reuseIdentifier: "label-10") { label, _, _ in
                    label.text = "prvni"
                    label.font = UIFont.boldSystemFont(ofSize: 12)
                    label.textColor = .red
                    label.textAlignment = .center
                },
                UINode<UILabel>(reuseIdentifier: "label-11") { label, _, _ in
                    label.text = "prvni"
                    label.font = UIFont.boldSystemFont(ofSize: 12)
                    label.textColor = .red
                    label.textAlignment = .center
                },
                UINode<UILabel>(reuseIdentifier: "label-12") { label, _, _ in
                    label.text = "prvni"
                    label.font = UIFont.boldSystemFont(ofSize: 12)
                    label.textColor = .red
                    label.textAlignment = .center
                },
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
    
    override func didMount(in view: UIView?) {
        super.didMount(in: view)
    }
    
}

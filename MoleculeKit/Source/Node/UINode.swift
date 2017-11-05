//
//  UINode.swift
//  MoleculeKit
//
//  Created by Topic, Zdenek on 01/11/2017.
//  Copyright © 2017 Zdenek Topic. All rights reserved.
//

import Foundation
import UIKit

open class UINode<ViewType: View>: UINodeType {
    
    // MARK: - Initializers
    
    public init(
        reuseIdentifier: UINodeIdentifiable,
        create: @escaping CreateClosure = { ViewType() },
        configure: @escaping ConfigurationClosure = { _, _, _ in }
    ) {
        self.reuseIdentifier = reuseIdentifier.reuseIdentifier
        self.creation = create
        self.configuration = configure
    }
    
    // MARK: - Reusability
    
    open let reuseIdentifier: String
    
    // MARK: - View creation, configuration and layout
    
    public typealias Layout = YGLayout
    public typealias CreateClosure = () -> ViewType
    public typealias ConfigurationClosure = (ViewType, Layout, CGSize) -> Void
    
    open var configuration: ConfigurationClosure
    open var creation: CreateClosure
    
    @discardableResult
    open func configure(_ closure: @escaping ConfigurationClosure) -> Self {
        configuration = closure
        return self
    }
    
    // MARK: - Children management
    
    open var children: [UINodeType] = []
    
    @discardableResult
    open func child(_ child: UINodeType) -> Self {
        children = [child]
        return self
    }
    
    @discardableResult
    open func children(_ children: [UINodeType]) -> Self {
        self.children = children
        return self
    }
    
    @discardableResult
    open func append(child: UINodeType) -> Self {
        children.append(child)
        return self
    }
    
    @discardableResult
    open func append(children: [UINodeType]) -> Self {
        self.children.append(contentsOf: children)
        return self
    }
    
    // MARK: - Reconciliation
    
    private var _renderedView: ViewType? = nil
    
    open var renderedView: View? {
        return _renderedView
    }
    
    open func setup(size: CGSize) {
        configuration(_renderedView!, _renderedView!.yoga, size)
        
        for child in children {
            child.setup(size: size)
        }
    }
    
    open func construct(with view: View?) {
        assert(Thread.isMainThread)

        guard _renderedView == nil else {
            return
        }
        
        if let reusableView = view as? ViewType {
            _renderedView = reusableView
        } else {
            let view = creation()
            view.yoga.isEnabled = true
            view.tag = reuseIdentifier.hashValue
            let context = UINodeContext()
            context.managed = true
            view._nodeContext = context
            _renderedView = view
        }
    }
    
    typealias ViewInfo = (managed: Bool, index: Int, view: View)
    
    open func reconcile(with reusableView: View?, currentIndex: Int?, in parent: View, toIndex index: Int) {
        assert(Thread.isMainThread)
        
        // The candidate view is a good match for reuse.
        if let view = reusableView, view._nodeContext?.managed == true && view.tag == reuseIdentifier.hashValue {
            construct(with: view)
            if index != currentIndex {
                renderedView!.removeFromSuperview()
                parent.insertSubview(_renderedView!, at: index)
            }
        } else {
            // The view for this node needs to be created.
            reusableView?.removeFromSuperview()
            construct(with: nil)
//            renderedView!.renderContext.isNewlyCreated = true
            parent.insertSubview(_renderedView!, at: index)
        }
        
        // Gets all of the existing subviews.
        var infos = reusableView?.subviews.enumerated().map { (index, view) in
            return ViewInfo(managed: view._nodeContext?.managed == true, index: index, view: view)
//            return view._nodeContext?.managed == true
        }
        
        for (sIndex, subnode) in children.enumerated() {
            // Look for a candidate view matching the node.
            let infoIndex = infos?.index(where: { info in
                return (
                    info.managed
                    && info.view.tag == subnode.reuseIdentifier.hashValue
                )
            })
            
            var candidate: ViewInfo?
            if let index = infoIndex {
                candidate = infos?[index]
                infos?.remove(at: index)
            }
            
            // Recursively reconcile the subnode.
            subnode.reconcile(with: candidate?.view, currentIndex: candidate?.index, in: _renderedView!, toIndex: sIndex)
        }
        
        // Remove all of the obsolete old views that couldn't be recycled.
        for info in infos ?? [] {
            info.view.removeFromSuperview()
        }
    }
    
}

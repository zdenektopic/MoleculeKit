//
//  UIComponent.swift
//  MoleculeKit
//
//  Created by Topic, Zdenek on 01/11/2017.
//  Copyright © 2017 Zdenek Topic. All rights reserved.
//

import Foundation

open class UIComponent<StateType: UIComponentState, PropsType: UIComponentProps>: UIComponentType {
    
    open var state: StateType = StateType() {
        didSet {
            needsUpdateRoot = true
        }
    }
    
    open var props: PropsType = PropsType() {
        didSet {
            needsUpdateRoot = true
        }
    }
    
    private weak var parentView: View?
    private var needsUpdateRoot: Bool = true
    private var rootNode: UINodeType?
    private var nodeView: View? {
        return rootNode?.renderedView
    }
    
    // MARK: - Initializers
    
    public init() {}
    
    // MARK: - Render - hierarchy
    
    open func render(state: StateType, props: PropsType) -> UINodeType {
        fatalError("`\(type(of: self)).render(state:props:)` must be overriden")
    }
    
    // MARK: - Requesting an update
    
    open func update() {
        DispatchQueue.main.async { [weak self] in
            self?.parentView?.setNeedsLayout()
        }
    }
    
    // MARK: - Layout
    
    open func layout() {
        assert(Thread.isMainThread)
        
        guard let parent = parentView else {
            return
        }
        
        let startTime = CFAbsoluteTimeGetCurrent()
        
        _updateRootIfNeeded()
        _layout(in: parent)
        _didLayout(view: nodeView!)
        
        debugReconcileTime(in: self, startTime: startTime)
    }
    
    // MARK: - Mounting in View
    
    open func mount(in view: View?) {
        assert(Thread.isMainThread)
        
        self.parentView = view
        didMount(in: view)
    }
    
    // MARK: - Lifecycle notifications
    
    open func didLayout() {}
    open func didReconcile() {}
    open func didUpdateProps() {}
    open func didUpdateState() {}
    open func didMount(in view: View?) {}
    
    // MARK: - Private helpers
    
    private func _didLayout(view: View) {
        if let renderable = view as? UIRenderable {
            renderable.didLayout()
        }
        
        for subview in view.subviews where subview._nodeContext != nil {
            _didLayout(view: subview)
        }
    }
    
    private func _updateRootIfNeeded() {
        if needsUpdateRoot || rootNode == nil {
            needsUpdateRoot = false
            rootNode = render(state: self.state, props: self.props)
        }
    }
    
    private func _layout(in parent: View) {
        let candidateIndex = parent.subviews.index { view in
            return view._nodeContext != nil
        }
        
        var candidateView: View?
        if let index = candidateIndex {
            candidateView = parent.subviews[index]
        }
        
        rootNode!.reconcile(with: candidateView, currentIndex: candidateIndex, in: parent, toIndex: 0)
        rootNode!.setup(size: parent.bounds.size)
        nodeView!.bounds.size = parent.bounds.size
        nodeView!.yoga.applyLayout(preservingOrigin: false)
    }
    
    // MARK: - iOS/macos View support
    
    open var intrinsicContentSize: CGSize {
        return nodeView!.yoga.intrinsicSize
    }
    
    open func sizeThatFits(_ size: CGSize) -> CGSize {
        return nodeView!.yoga.calculateLayout(with: size)
    }
    
}

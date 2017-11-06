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
    
    open var intrinsicContentSize: CGSize {
        return nodeView!.yoga.intrinsicSize
    }
    
    private weak var parentView: View?
    private var needsUpdateRoot: Bool = true
    private var rootNode: UINodeType?
    private var nodeView: View? {
        return rootNode?.renderedView
    }
    
    public init() {}
    
    open func render(state: StateType, props: PropsType) -> UINodeType {
        fatalError("`\(type(of: self)).render(state:props:)` must be overriden")
    }
    
    open func update() {
        parentView?.setNeedsLayout()
    }
    
    open func layout() {
        assert(Thread.isMainThread)
        
        guard let parent = parentView else {
            print("calling without being assigned to view")
            return
        }
        
        if needsUpdateRoot {
            needsUpdateRoot = false
            rootNode = render(state: self.state, props: self.props)
        }
        
        let startTime = CFAbsoluteTimeGetCurrent()
        
        let candidateIndex = parent.subviews.index { view in
            return view._nodeContext?.managed == true
        }
        
        var candidateView: View?
        if let index = candidateIndex {
            candidateView = parent.subviews[index]
        }
        
        rootNode!.reconcile(with: candidateView, currentIndex: candidateIndex, in: parent, toIndex: 0)
        rootNode!.setup(size: parent.bounds.size)
        nodeView!.bounds.size = parent.bounds.size
        nodeView!.yoga.applyLayout(preservingOrigin: false)
        
        debugReconcileTime(in: self, startTime: startTime)
    }
    
    open func mount(in view: View) {
        assert(Thread.isMainThread)
        
        self.parentView = view
        didMount(in: view)
    }
    
    open func didLayout() {}
    open func didReconcile() {}
    open func didUpdateProps() {}
    open func didUpdateState() {}
    open func didMount(in view: View) {}
    
}

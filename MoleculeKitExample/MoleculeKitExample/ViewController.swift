//
//  ViewController.swift
//  MoleculeKitExample
//
//  Created by Topic, Zdenek on 01/11/2017.
//  Copyright © 2017 Zdenek Topic. All rights reserved.
//

import UIKit
import MoleculeKit

class ViewController: UIViewController {

    var timer: Timer?
    let component = ListTableComponent()
    var componentView: UIComponentView<ListTableComponent>!
    
    override func loadView() {
        super.loadView()
        componentView = UIComponentView(component)
        view = componentView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        component.update()
        
        timer = Timer.scheduledTimer(withTimeInterval: 2, repeats: true, block: { [weak self] (_) in
            print("tick")
//            let vc = ViewController()
//            self?.navigationController?.pushViewController(vc, animated: true)
            self?.component.update()
        })
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


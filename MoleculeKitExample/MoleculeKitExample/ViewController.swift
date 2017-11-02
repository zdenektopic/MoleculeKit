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
    
    override func loadView() {
        super.loadView()
        view = UIComponentView(component)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        timer = Timer.scheduledTimer(withTimeInterval: 5, repeats: false, block: { [weak self] (_) in
            print("tick")
            let vc = ViewController()
            self?.navigationController?.pushViewController(vc, animated: true)
        })
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


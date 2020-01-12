//
//  SecondViewController.swift
//  Bloc Architecture
//
//  Created by Joshua Colley on 08/10/2019.
//  Copyright © 2019 Joshua Colley. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var toggleSwitch: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        toggleSwitch.addTarget(self, action: #selector(switchAction), for: .valueChanged)
    }
    
    @objc func switchAction() {
        BLoC.shared.setValue(toggleSwitch.isOn)
    }
}


//
//  FirstViewController.swift
//  Bloc Architecture
//
//  Created by Joshua Colley on 08/10/2019.
//  Copyright © 2019 Joshua Colley. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(didReceiveNotification(_:)),
                                               name: BLoCNotification.didUpdateValue.name,
                                               object: nil)
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        BLoC.shared.getValue(forceUpdate: true)
    }
    
    @objc func didReceiveNotification(_ sender: NSNotification) {
        if let switchIsOn = sender.userInfo?[BLoCNotification.didUpdateValue.key] as? Bool {
            label.text = switchIsOn ? "Switch is on!" : "Switch is off!"
        }
    }
}


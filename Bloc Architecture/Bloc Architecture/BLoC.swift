//
//  BLoC.swift
//  Bloc Architecture
//
//  Created by Joshua Colley on 08/10/2019.
//  Copyright © 2019 Joshua Colley. All rights reserved.
//

import Foundation

enum BLoCNotification: String {
    case didUpdateValue
    
    var name: NSNotification.Name {
        switch self {
        case .didUpdateValue: return NSNotification.Name("didUpdateValue")
        }
    }
    
    var key: String {
        switch self {
        case .didUpdateValue: return "value"
        }
    }
}

protocol BLoCProtocol {
    func setValue(_ value: Bool)
    func getValue(forceUpdate: Bool)
}

class BLoC: BLoCProtocol {
    static let shared: BLoCProtocol = BLoC()
    
    private var _value: Bool = false {
        didSet {
            notifyValueObservers()
        }
    }
    
    // MARK: - Private Methods
    private func notifyValueObservers() {
        NotificationCenter.default.post(name: BLoCNotification.didUpdateValue.name,
                                        object: nil,
                                        userInfo: ["value": _value])
    }
    
    // MARK: - Protocol Methods
    func setValue(_ value: Bool) {
        self._value = value
    }
    
    func getValue(forceUpdate: Bool) {
        if forceUpdate {
            self._value = false
        }
        notifyValueObservers()
    }
}



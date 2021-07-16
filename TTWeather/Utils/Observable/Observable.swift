//
//  Observable.swift
//  TTWeather
//
//  Created by Sinan Özman on 14.07.2021.
//

import Foundation

/// Observable Object
class Observable<T> {
    
    /// Observable Object Generic Type Value
    var value: T {
        didSet {
            listener?(value)
        }
    }
    
    /// Completion Block
    private var listener: ((T) -> Void)?
    
    /// Decleration View Generic Type Object
    /// - Parameter value: Generic Type
    init(_ value: T) {
        self.value = value
    }
    
    /// Binding Object
    /// - Parameter closure: Generic Type self
    func bind(_ closure: @escaping (T) -> Void) {
        closure(value)
        listener = closure
    }
}

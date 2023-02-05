//
//  DependencyInjector.swift
//  RickAndMorty
//
//  Created by Santiago Pereira on 3/2/23.
//

import SwiftUI

struct DependencyInjector {
    private static var dependencyList: [String: Any] = [:]
    
    static func resolve<T>() -> T? {
        guard let t = dependencyList[String(describing: T.self)] as? T else {
            if ProcessInfo.IS_UNIT_TESTING {
                Log.verbose("No provider register for type: \(T.self)")
            } else {
                fatalError("No provider register for type: \(T.self)")
            }
            return nil
        }
        return t
    }
    
    static func register<T>(dependency: T) {
        dependencyList[String(describing: T.self)] = dependency
    }
}

@propertyWrapper struct Inject<T> {
    var wrappedValue: T?
    
    init() {
        self.wrappedValue = DependencyInjector.resolve()
        Log.verbose("Injected <- \(String(describing: self.wrappedValue))")
    }
}

@propertyWrapper struct Provider<T> {
    var wrappedValue: T
    
    init(wrappedValue: T) {
        self.wrappedValue = wrappedValue
        DependencyInjector.register(dependency: wrappedValue)
        Log.verbose("Provide -> \(self.wrappedValue)")
    }
}

//
//  AppStorage.swift
//  moodify-ios
//
//  Created by polykuzin on 26/03/2022.
//

import Foundation

@propertyWrapper
struct AppStorage<T> {
    
    private let key : String
    private let defaultValue : T

    init(key: String, defaultValue: T) {
        self.key = key
        self.defaultValue = defaultValue
    }

    var wrappedValue: T {
        get {
            return UserDefaults.standard.object(forKey: key) as? T ?? defaultValue
        }
        set {
            UserDefaults.standard.set(newValue, forKey: key)
            UserDefaults.standard.synchronize()
        }
    }
}

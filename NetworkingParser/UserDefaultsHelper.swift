//
//  UserDefaultsHelper.swift
//  NetworkingParser
//
//  Created by Nazario Mariano on 8/10/21.
//

import Foundation

struct UserDefaultsHelper {
    static var scrollDirection: Int {
        let userDefaults = UserDefaults.standard
        return userDefaults.integer(forKey: UserDefaultKey.scrollDirection)
    }
    
    static func set(scrollDirection: Int) {
        let userDefaults = UserDefaults.standard
            userDefaults.set(scrollDirection, forKey: UserDefaultKey.scrollDirection)
    }
}

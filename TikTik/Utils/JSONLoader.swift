//
//  JSONLoader.swift
//  TikTik
//
//  Created by Priscila Oliveira on 07/04/25.
//

import Foundation

struct JSONLoader {
    
    static func saveToUserDefaults<T: Encodable>(_ object: T, forKey key: String) -> Bool {
        if let encodedData = try? JSONEncoder().encode(object) {
            UserDefaults.standard.set(encodedData, forKey: key)
            return true
        }
        return false
    }
    
    static func loadFromUserDefaults<T: Decodable>(_ type: T.Type, forKey key: String) -> T? {
        guard
            let data = UserDefaults.standard.data(forKey: key),
            let decodedObject = try? JSONDecoder().decode(type, from: data)
        else { return nil }
        
        return decodedObject
    }
}

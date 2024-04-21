//
//  DataManager.swift
//  Yoga Assignment
//
//  Created by Pierre Janineh on 21/04/2024.
//

import Foundation

class DataManager {
    
    static let shared = DataManager()
    
    lazy var sessions: Sessions = {
        do {
            return try loadData(from: "sessions", ofType: Sessions.self) ?? Sessions(array: [])
        } catch {
            fatalError("Could not load json file with error \(error)")
        }
    }()
    
    private init() { }
    
    private func loadData<T:Codable>(from fileName: String, ofType type: T.Type) throws -> T? {
        guard let filePath = Bundle.main.url(forResource: fileName, withExtension: "json")
        else { return nil }
        
        let jsonData = try Data(contentsOf: filePath)
        
        return try JSONDecoder().decode(T.self, from: jsonData)
    }
}

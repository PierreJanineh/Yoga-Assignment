//
//  Intensity.swift
//  Yoga Assignment
//
//  Created by Pierre Janineh on 21/04/2024.
//

import SwiftUI

enum Intensity: String, Codable {
    case Easy
    case Medium
    case Hard
    
    var icon: ImageResource {
        switch self {
        case .Easy: return .intensity1
        case .Medium: return .intensity2
        case .Hard: return .intensity3
        }
    }
}

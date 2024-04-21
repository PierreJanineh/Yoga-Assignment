//
//  Session.swift
//  Yoga Assignment
//
//  Created by Pierre Janineh on 21/04/2024.
//

import Foundation

struct Session: Codable {
    let length: Int
    let quoteAuthor: String
    let quote: String
    let chapterName: String
    let chapter: Int
    let difficulty: Intensity
}

struct Sessions: Codable {
    let array: [Session]
}

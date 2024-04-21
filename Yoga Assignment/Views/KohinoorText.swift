//
//  KohinoorText.swift
//  Yoga Assignment
//
//  Created by Pierre Janineh on 21/04/2024.
//

import SwiftUI

struct KohinoorText: View {
    let text: String
    let size: CGFloat
    let medium: Bool

    init(_ text: String, size: CGFloat = 16, medium: Bool = false) {
        self.text = text
        self.size = size
        self.medium = medium
    }
    
    var body: some View {
        Text(text)
            .font(.custom(medium ? "Kohinoor-Medium" : "Kohinoor-Book", size: size))
    }
}

#Preview {
    KohinoorText("")
}

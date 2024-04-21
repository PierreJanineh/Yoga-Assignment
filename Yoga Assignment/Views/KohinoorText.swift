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

    init(_ text: String, size: CGFloat = 16) {
        self.text = text
        self.size = size
    }
    
    var body: some View {
        Text(text)
            .font(.custom("Kohinoor", size: size))
    }
}

#Preview {
    KohinoorText("")
}

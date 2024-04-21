//
//  SessionCard.swift
//  Yoga Assignment
//
//  Created by Pierre Janineh on 21/04/2024.
//

import SwiftUI

struct SessionCard: View {
    
    let session: Session
    let i: Int
    
    var body: some View {
        VStack {
            Text("Session \(i + 1)")
                .frame(maxWidth: .infinity)
                .overlay(alignment: .bottom) {
                    Rectangle()
                        .fill(.gray)
                        .frame(height: 1)
                        .offset(y: 5)
                }
                .padding()
            
            HStack {
                Spacer()
                
                Image(.sessionDuration)
                Text("\(session.length) min")
                
                Spacer(minLength: 5)
                
                Image(.intensity1)
                Text(session.difficulty.rawValue)
                
                Spacer()
            }
            
            Text("\"\(session.quote)\"")
                .multilineTextAlignment(.center)
            
            Text(session.quoteAuthor)
            
            Button {
                //TODO: Show simple alert and check session
            } label: {
                Text("Did it")
                    .foregroundStyle(.black)
                    .padding()
                    .padding(.horizontal, 30)
                    .background {
                        RoundedRectangle(cornerRadius: 30)
                            .fill(.aqua)
                    }
            }
        }
        .background {
            RoundedRectangle(cornerRadius: 15)
                .fill(.white.opacity(0.9))
        }
    }
}

#Preview {
    SessionCard(session: Session(length: 16,
                                 quoteAuthor: "Lao Tzu",
                                 quote: "A journey of a thousand miles begins with a single step",
                                 chapterName: "Neck & Shoulders Awakening",
                                 chapter: 1,
                                 difficulty: .Easy),
                i: 0)
}

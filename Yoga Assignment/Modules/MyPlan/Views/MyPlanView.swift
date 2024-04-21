//
//  MyPlanView.swift
//  Yoga Assignment
//
//  Created by Pierre Janineh on 21/04/2024.
//

import SwiftUI

struct MyPlanView: View {
    var body: some View {
        VStack {
            Spacer()
            
            HStack {
                Image(.planInfo)
                
                Spacer()
                
                VStack {
                    KohinoorText("MY PLAN")
                        .overlay(alignment: .bottom) {
                            Rectangle()
                                .frame(height: 1)
                        }
                    KohinoorText("CHAPTER 1")
                    
                    KohinoorText("Welcome Session")
                }
                
                Spacer()
            }
            .padding()
            
            Spacer(minLength: 100)
            
            SessionsScroller()
            
            Spacer(minLength: 50)
        }
        .background {
            Image(.chapter1BG)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .ignoresSafeArea()
        }
    }
}

#Preview {
    MyPlanView()
}

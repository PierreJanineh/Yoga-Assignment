//
//  MyPlanView.swift
//  Yoga Assignment
//
//  Created by Pierre Janineh on 21/04/2024.
//

import SwiftUI

struct MyPlanView: View {
    
    @State private var alertPresented = false
    
    var body: some View {
        VStack {
            Spacer()
            
            HStack {
                Spacer()
                
                VStack {
                    KohinoorText("MY PLAN", medium: true)
                        .overlay(alignment: .bottom) {
                            Rectangle()
                                .frame(height: 1)
                        }
                    
                    KohinoorText("CHAPTER 1", size: 14)
                        .padding(2)
                    
                    KohinoorText("Welcome Session", medium: true)
                }
                
                Spacer()
            }
            .padding()
            .overlay(alignment: .topLeading) {
                Image(.planInfo)
                    .padding()
                    .onTapGesture {
                        alertPresented.toggle()
                    }
            }
            .alert("Title", isPresented: $alertPresented) { }
            
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

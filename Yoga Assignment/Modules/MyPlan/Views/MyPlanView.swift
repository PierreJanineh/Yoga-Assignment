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
                    Text("MY PLAN")
                        .overlay(alignment: .bottom) {
                            Rectangle()
                                .frame(height: 1)
                        }
                    Text("CHAPTER 1")
                    
                    Text("Welcome Session")
                }
                
                Spacer()
            }
            .padding()
            
            Spacer()
            
            SessionsScroller()
            
            Spacer()
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

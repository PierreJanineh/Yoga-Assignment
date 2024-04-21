//
//  SessionsScroller.swift
//  Yoga Assignment
//
//  Created by Pierre Janineh on 21/04/2024.
//

import SwiftUI

struct SessionsScroller: View {
    
    private let sessions = DataManager.shared.sessions.array
    
    @State private var offset = CGFloat.zero
        
    var body: some View {
        GeometryReader { geometry in
            ScrollViewReader { scrollView in
                VStack {
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 20) {
                            ForEach(sessions.indices, id: \.self) { i in
                                SessionCard(session: sessions[i], i: i)
                                    .id(i)
                                    .frame(width: geometry.size.width * 0.8)
                            }
                        }
                        .scrollTargetLayout()
                        .background(GeometryReader {
                            Color.clear.preference(key: ViewOffsetKey.self,
                                                   value: -$0.frame(in: .named("scroll")).origin.x)
                        })
                        .onPreferenceChange(ViewOffsetKey.self) { value in
                            offset = value
                        }
                    }
                    .scrollTargetBehavior(.viewAligned)
                    .safeAreaPadding(.horizontal, 40)
                    .coordinateSpace(name: "scroll")
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 0) {
                            ForEach(sessions.indices, id: \.self) { i in
                                HStack {
                                    Spacer()
                                    
                                    Divider()
                                        .background(.white.opacity(0.9))
                                        .padding(.vertical, 10)
                                }
                                .overlay(alignment: .center) {
                                    Text((i + 1).description)
                                        .id(i)
                                        .frame(maxWidth: .infinity)
                                        .foregroundStyle(.white)
                                }
                                .frame(width: 39)
                            }
                        }
                        .frame(maxWidth: .infinity)
                        .frame(height: 45)
                        .scrollTargetLayout()
                        .offset(x: -(offset / (geometry.size.width * 0.8)).rounded() * 39)
                    }
                    .overlay(alignment: .center) {
                        Image(.scrollerFrame)
                    }
                    .background(.black.opacity(0.5))
                    .scrollTargetBehavior(.viewAligned)
                    .safeAreaPadding(.horizontal, geometry.size.width * 0.45)
                }
            }
        }
    }
}

#Preview {
    SessionsScroller()
}

struct ViewOffsetKey: PreferenceKey {
    typealias Value = CGFloat
    static var defaultValue = CGFloat.zero
    static func reduce(value: inout Value, nextValue: () -> Value) {
        value += nextValue()
    }
}

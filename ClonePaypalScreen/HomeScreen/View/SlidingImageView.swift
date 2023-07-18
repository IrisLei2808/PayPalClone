//
//  SlidingImageView.swift
//  ClonePaypalScreen
//
//  Created by Duc Le on 7/17/23.
//

import SwiftUI

struct SlidingImageView: View {
    @State private var currentIndex = 0
    @GestureState private var translation: CGFloat = 0
    
    @Binding var images: [String]
    
    var body: some View {
        VStack {
            TabView(selection: $currentIndex) {
                ForEach(0..<images.count, id: \.self) { index in
                    Image(images[index])
                        .resizable()
                        .scaledToFill()
                        .frame(height: 200)
                        .clipped()
                        .overlay(
                            VStack(alignment: .leading, spacing: 4) {
                                Spacer()
                                Text("Feeding America")
                                    .font(.title)
                                    .foregroundColor(.white)
                                    .padding(.horizontal, 8)
                                    .padding(.vertical, 4)
                                    .cornerRadius(4)
                                    .alignmentGuide(.leading) { _ in
                                        0
                                    }
                            }
                                .frame(maxWidth: .infinity, alignment: .bottomLeading)
                                .padding(8)
                        )
                        .tag(index)

                }
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            .frame(height: 200)
            .padding(.horizontal, 10)
        }
        .gesture(
            DragGesture().onEnded { value in
                if value.translation.width < 0 {
                    currentIndex = min(currentIndex + 1, images.count - 1)
                }
                
                if value.translation.width > 0 {
                    currentIndex = max(currentIndex - 1, 0)
                }
            }
        )
    }
}

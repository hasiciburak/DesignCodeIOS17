//
//  ContentView.swift
//  DesignCode
//
//  Created by Burak Haşıcı on 27.01.2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Image(.image1)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(height: 300)
                .cornerRadius(20)
            VStack(alignment: .center) {
                Image(systemName: "sparkles")
                    .imageScale(.large)
                    .foregroundStyle(.secondary)
                Text("modern architecture, an isometric tiny house")
                    .font(.subheadline)
                HStack {
                    VStack(alignment: .leading) {
                        Text("Size")
                            .foregroundColor(Color.secondary)
                        Text("1024x1024")
                            .fontWeight(.semibold)
                    }
                    Divider()
                    VStack(alignment: .leading) {
                        Text("Type")
                            .foregroundColor(Color.secondary)
                        Text("Upscale")
                            .fontWeight(.semibold)
                    }
                    Divider()
                        .frame(width: 2)
                    VStack(alignment: .leading) {
                        Text("Date")
                            .foregroundColor(Color.secondary)
                        Text("Today 5:19")
                            .fontWeight(.semibold)
                    }
                }
                .frame(height: 44.0)
                // Options
                HStack {
                    HStack {
                        Image(systemName: "ellipsis")
                        Image(systemName: "sparkle.magnifyingglass")
                        Image(systemName: "face.smiling")
                    }
                    .padding()
                    .frame(height: 44)
                    .overlay(UnevenRoundedRectangle(cornerRadii: RectangleCornerRadii(
                        topLeading: 0,
                        bottomLeading: 20,
                        bottomTrailing: 0,
                        topTrailing: 20
                    ))
                        .strokeBorder(linearGradient)
                    )
                    .offset(x: -20, y: 20)
                    Spacer()
                    Image(systemName: "square.and.arrow.down")
                        .padding()
                        .frame(height: 44)
                        .overlay(UnevenRoundedRectangle(cornerRadii: RectangleCornerRadii(
                            topLeading: 20,
                            bottomLeading: 0,
                            bottomTrailing: 20,
                            topTrailing: 0
                        ))
                        .strokeBorder(linearGradient)
                        )
                        .offset(x: 20, y: 20)
                }
            }
            .padding(20.0)
            .background(.regularMaterial)
            .overlay(RoundedRectangle(cornerRadius: 20)
                .strokeBorder(linearGradient)
            )
            .cornerRadius(20)
            .padding(20)
            .offset(y: 80)
        }
        .frame(maxWidth: 400)
        .padding(20)
        // Provides with elements from size to to size...
        .dynamicTypeSize(.xSmall ... .xLarge)
    }

    var linearGradient: LinearGradient {
        LinearGradient(
            colors: [.clear,
                                .primary.opacity(0.3),
                                .clear],
                       startPoint: .topLeading,
                       endPoint: .bottomTrailing)
    }
}

#Preview {
    ContentView()
}

//
//  ContentView.swift
//  DesignCode
//
//  Created by Burak Haşıcı on 27.01.2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(alignment: .center){
            Image(systemName: "sparkles")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("modern architecture, an isometric tiny house")
                .font(.subheadline)
            HStack{
                VStack(alignment: .leading){
                    Text("Size")
                        .foregroundColor(Color.secondary)
                    Text("1024x1024")
                        .fontWeight(.semibold)
                }
                Divider()
                VStack(alignment: .leading){
                    Text("Type")
                        .foregroundColor(Color.secondary)
                    Text("Upscale")
                        .fontWeight(.semibold)
                }
                Divider()
                    .frame(width: 2)
                VStack(alignment: .leading){
                    Text("Date")
                        .foregroundColor(Color.secondary)
                    Text("Today 5:19")
                        .fontWeight(.semibold)
                }
            }
            .frame(height: 44.0)
        }
        .padding(20.0)
        .background(.green.gradient)
        .cornerRadius(20)
    }
}
#Preview {
    ContentView()
}

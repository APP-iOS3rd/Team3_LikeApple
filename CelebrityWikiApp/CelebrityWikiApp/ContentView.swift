//
//  ContentView.swift
//  CelebrityWikiApp
//
//  Created by seobe22 on 11/2/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "checkmark")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("제발 됐으면 좋겠당")
        }
        .padding()
    }
}

#Preview {
    ContentView()
}

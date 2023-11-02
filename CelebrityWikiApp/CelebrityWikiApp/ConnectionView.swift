//
//  ConnectionView.swift
//  CelebrityWikiApp
//
//  Created by 노주영 on 2023/11/02.
//

import SwiftUI

struct ConnectionView: View {
    var body: some View {
        VStack {
            TabView() {
                ContentView()
                    .tabItem {
                        Image(systemName: "circle.fill")
                        Text("ScenceStorage")
                    }
                    
                    
                QuizView()
                    .tabItem {
                        Image(systemName: "square.fill")
                        Text("AppStorage")
                    }
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(uiColor: UIColor.systemGray4))
    }
}

#Preview {
    ConnectionView()
}

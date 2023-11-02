//
//  QuizView.swift
//  CelebrityWikiApp
//
//  Created by 노주영 on 2023/11/02.
//

import SwiftUI

struct QuizView: View {
    var body: some View {
        NavigationStack {
            VStack {
                Text("Quiz")
                    .font(.system(size: 80))
                    .bold()
                    .padding(.top, 50)
                
                Spacer()
                
                Button(action: {
                    
                }, label: {
                    Text("Start")
                        .font(.largeTitle)
                        .foregroundStyle(.black)
                })
                .frame(width: 200, height: 50)
                .background(Color(uiColor: UIColor.systemGray4))
                .padding(.bottom, 40)
            }
        }
    }
}

#Preview {
    QuizView()
}

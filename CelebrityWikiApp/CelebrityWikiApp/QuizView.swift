//
//  QuizView.swift
//  CelebrityWikiApp
//
//  Created by 노주영 on 2023/11/02.
//

import SwiftUI

struct QuizView: View {
    
    @StateObject var celebrityVM: CelebrityViewModel
    
    @State private var changeText: String = "Start"
    @State private var isAnimation = false
    @State private var quizText: String = "Quiz"
    
    //Image 흐림 정도
    @State var blur: [Int]
    //TextField 변수
    @State var answer: [String]
    //결과 변수
    @State var resultText: [String]
    
    var body: some View {
        VStack {
            Spacer()
            ZStack {
                ScrollView(.horizontal, content: {
                    HStack {
                        ForEach ($celebrityVM.celebrityList) { (i: Binding<CelebrityModel>) in
                            VStack {
                                Text("문제 \(i.wrappedValue.index+1)")
                                    .padding()
                                    .modifier(StandardCustomFontText())
                                    .multilineTextAlignment(.center)
                                    .background(Color(uiColor: UIColor.systemGray4))
                                    .cornerRadius(10)
                                
                                AsyncImage(url: URL(string: i.wrappedValue.imageName)!) {
                                     image in
                                     image
                                         .resizable()
                                         .frame(width: 320, height: 320)
                                         .aspectRatio(contentMode: .fit)
                                         .blur(radius: CGFloat(blur[i.wrappedValue.index]))
                                         .padding()
                                 } placeholder: {
                                     ProgressView()
                                 }
                                
                                TextField("\(i.wrappedValue.index+1)번 답", text: $answer[i.wrappedValue.index])
                                    .textFieldStyle(RoundedBorderTextFieldStyle())
                                    .border(.gray, width: 3)
                                    .cornerRadius(5)
                                    .modifier(StandardCustomFontText())
                                    .padding(.horizontal)
                                
                                HStack {
                                    Button(action: { blur[i.wrappedValue.index] -= 2 }, label: {
                                        Text("Hint")
                                            .modifier(StandardCustomFontText())
                                    })
                                    .frame(width: 100, height: 50)
                                    .background(Color(uiColor: UIColor.systemGray4))
                                    .cornerRadius(10)
                                    .padding(.vertical, 20)
                                    
                                    Spacer()
                                    Text(resultText[i.wrappedValue.index])
                                        .modifier(StandardCustomFontText())
                                        .bold()
                                    
                                    Spacer()
                                    Button(action: {
                                        if answer[i.wrappedValue.index] == i.wrappedValue.name {
                                            resultText[i.wrappedValue.index] = "O"
                                        } else {
                                            resultText[i.wrappedValue.index] = "X"
                                        }
                                    }, label: {
                                        Text("Result")
                                            .modifier(StandardCustomFontText())
                                    })
                                    .frame(width: 100, height: 50)
                                    .background(Color(uiColor: UIColor.systemGray4))
                                    .cornerRadius(10)
                                    .padding(.vertical, 20)
                                }
                                .padding(.horizontal)
                            }
                        }
                    }
                })
                .frame(maxWidth: isAnimation ? .infinity: 0, maxHeight: isAnimation ? .infinity : 0)
                .animation(.spring(response: 1, dampingFraction: 0.6 ,blendDuration: 40))
                .padding(.vertical, 10)
                
                Text(quizText)
                    .font(.system(size: 80))
                    .bold()
                    .padding(.top, 50)
                    
            }
            .padding()
            
            Spacer()
            Button(action: clickStart, label: {
                Text(changeText)
                    .modifier(StandardCustomFontText())
            })
            .frame(width: 200, height: 50)
            .background(Color(uiColor: UIColor.systemGray4))
            .cornerRadius(10)
            .padding(.bottom, 40)
        }
    }
    
    func clickStart() {
        if changeText == "Start" {
            quizText = ""
            isAnimation = true
            changeText = "End"
        } else {
            quizText = "Quiz"
            isAnimation = false
            changeText = "Start"
        }
    }
}

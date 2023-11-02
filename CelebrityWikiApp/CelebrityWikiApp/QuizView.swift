//
//  QuizView.swift
//  CelebrityWikiApp
//
//  Created by 노주영 on 2023/11/02.
//

import SwiftUI

struct QuizView: View {
    
    @State private var changeText: String = "Start"
    @State private var isAnimation = false
    @State private var quizText: String = "Quiz"
    
    //Image 흐림 정도
    @State private var blur: [Int] =  Array(repeating: 10, count: 5)
    
    //TextField 변수
    @State private var answer: [String] = Array(repeating: "", count: 5)
    
    var body: some View {
        VStack {
            Spacer()
            ZStack {
                ScrollView(.horizontal, content: {
                    HStack {
                        ForEach (0..<5) { i in
                            VStack {
                                Text("문제 \(i+1): " + "yuri".shuffled().map{String($0)}.joined())
                                    .padding()
                                    .modifier(StandardCustomFontText())
                                    .multilineTextAlignment(.center)
                                    .background(Color(uiColor: UIColor.systemGray4))
                                    .cornerRadius(10)
                                
                                Image("cute")
                                    .resizable()
                                    .frame(width: 320, height: 320)
                                    .aspectRatio(contentMode: .fit)
                                    .blur(radius: CGFloat(blur[i]))
                                    .padding()
                                
                                TextField("\(i+1)번 답", text: $answer[i])
                                    .textFieldStyle(RoundedBorderTextFieldStyle())
                                    .border(.gray, width: 3)
                                    .cornerRadius(5)
                                    .modifier(StandardCustomFontText())
                                    .padding(.horizontal)
                                
                                HStack {
                                    Button(action: { blur[i] -= 2 }, label: {
                                        Text("Hint")
                                            .modifier(StandardCustomFontText())
                                    })
                                    .frame(width: 100, height: 50)
                                    .background(Color(uiColor: UIColor.systemGray4))
                                    .cornerRadius(10)
                                    .padding(.vertical, 20)
                                    
                                    Spacer()
                                    
                                    Button(action: {}, label: {
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

#Preview {
    QuizView()
}

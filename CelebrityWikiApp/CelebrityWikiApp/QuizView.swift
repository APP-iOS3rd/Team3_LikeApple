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
    
    //TextField 변수
    @State private var answerOne: String = ""
    @State private var answerTwo: String = ""
    @State private var answerThree: String = ""
    @State private var answerFour: String = ""
    @State private var answerFive: String = ""
    
    @State private var isEditingOne: Bool = false
    @State private var isEditingTwo: Bool = false
    @State private var isEditingThree: Bool = false
    @State private var isEditingFour: Bool = false
    @State private var isEditingFive: Bool = false
    
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
                                    .padding()
                                
                                TextField("\(i+1)번 답", text: chooseAnswer(i))
                                    .textFieldStyle(RoundedBorderTextFieldStyle())
                                    .border(.gray, width: 3)
                                    .cornerRadius(5)
                                    .modifier(StandardCustomFontText())
                                    .padding(.horizontal)
                                
                                HStack {
                                    Button(action: {}, label: {
                                        Text("Hint")
                                            .modifier(StandardCustomFontText())
                                    })
                                    .frame(width: 100, height: 50)
                                    .background(Color(uiColor: UIColor.systemGray4))
                                    .cornerRadius(10)
                                    .padding(.vertical, 20)
                                    
                                    Spacer()
                                    
                                    Button(action: {}, label: {
                                        Text("Save")
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
    
    func chooseAnswer(_ i: Int) -> Binding<String>{
        switch i {
        case 0:     return $answerOne
        case 1:     return $answerTwo
        case 2:     return $answerThree
        case 3:     return $answerFour
        default:    return $answerFive
        }
    }
}

#Preview {
    QuizView()
}

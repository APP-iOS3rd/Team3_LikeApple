//
//  ConnectionView.swift
//  CelebrityWikiApp
//
//  Created by 노주영 on 2023/11/02.
//

import SwiftUI

struct ConnectionView: View {
    @StateObject var celebrityVM: CelebrityViewModel = CelebrityViewModel()
    
    var body: some View {
        VStack {
            TabView() {
                ContentView(celebrityVM: celebrityVM)
                    .tabItem {
                        Image(systemName: "circle.fill")
                        Text("Celebrity List")
                    }
                
                QuizView(celebrityVM: celebrityVM, blur: Array(repeating: 10, count: celebrityVM.celebrityList.count), answer: Array(repeating: "", count: celebrityVM.celebrityList.count), resultText: Array(repeating: "", count: celebrityVM.celebrityList.count))
                    .tabItem {
                        Image(systemName: "square.fill")
                        Text("Quiz")
                    }
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(uiColor: UIColor.systemGray4))
        .onAppear(perform: {
            celebrityVM.celebrityList = [
                CelebrityModel(name: "김세정", description: "걸그룹 아이오아이, 구구단 출신의 대한민국의 가수 겸 배우.", imageName: "https://i.namu.wiki/i/jRkpsWUzbWhu9-SjO1JbAVxkf0PIQYEUFIFXPapX0hDmW0slu6eu8SDVnM8YuDTI-KB-01gA3mSpc5t7oiWreY6TuEuC-nVtYRlsUxUBP2juTWyjwt7FaWg7hnIDiJRyIuFTSq62PJibGM4vtogiMA.webp", index: 0, link: "https://namu.wiki/w/%EA%B9%80%EC%84%B8%EC%A0%95"),
                CelebrityModel(name: "안유진", description: "스타쉽엔터테인먼트 소속 6인조 대한민국 걸그룹 IVE의 멤버이자 리더.", imageName: "https://i.namu.wiki/i/7LQn4pwsuLqwyGX_cbnA0to3Gy0JBUx6ZxdAtvDwga_JIGpLcUxPj0ehEuP_1_aiKF2T819or_4M5sAk0Dnj46kCiUK_O1vZ7X2anU60Bjmr61W0ufc9reilsagimY9F8oN9PN5gMHR_QIEw7V4DWg.webp", index: 1, link: "https://namu.wiki/w/%EC%95%88%EC%9C%A0%EC%A7%84"),
                CelebrityModel(name: "조유리", description: "걸그룹 IZ*ONE 출신의 대한민국의 가수 겸 배우.", imageName: "https://i.namu.wiki/i/pySjgsO1rPEhAp82Zpni9yDDDkEWSHUeQYKtlbjVq2aGvcpdBz0pyn_ktL6R57TsQ2-fwVGY-wgu9e5ePQfq1j6ZwPesQtRAMlWO3N5--Of_1muL5otkg9wwB8OK_XrSPSENhlwz10zDll6pdnJrEA.webp", index: 2, link: "https://namu.wiki/w/%EC%A1%B0%EC%9C%A0%EB%A6%AC")
            ]
        })
    }
}

#Preview {
    ConnectionView()
}

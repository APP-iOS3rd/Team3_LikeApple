//
//  ContentView.swift
//  CelebrityWikiApp
//
//  Created by seobe22 on 11/2/23.
//
import SwiftUI

struct ContentView: View {
  
  @StateObject var celebrityVM: CelebrityViewModel = CelebrityViewModel()
  @State private var data = [
    CelebrityModel(name: "김세정", description: "걸그룹 아이오아이, 구구단 출신의 대한민국의 가수 겸 배우.", isGender: false, imageName: "https://i.namu.wiki/i/jRkpsWUzbWhu9-SjO1JbAVxkf0PIQYEUFIFXPapX0hDmW0slu6eu8SDVnM8YuDTI-KB-01gA3mSpc5t7oiWreY6TuEuC-nVtYRlsUxUBP2juTWyjwt7FaWg7hnIDiJRyIuFTSq62PJibGM4vtogiMA.webp", index: 0, link: "https://namu.wiki/w/%EA%B9%80%EC%84%B8%EC%A0%95"),
    CelebrityModel(name: "안유진", description: "스타쉽엔터테인먼트 소속 6인조 대한민국 걸그룹 IVE의 멤버이자 리더.", isGender: false, imageName: "https://i.namu.wiki/i/7LQn4pwsuLqwyGX_cbnA0to3Gy0JBUx6ZxdAtvDwga_JIGpLcUxPj0ehEuP_1_aiKF2T819or_4M5sAk0Dnj46kCiUK_O1vZ7X2anU60Bjmr61W0ufc9reilsagimY9F8oN9PN5gMHR_QIEw7V4DWg.webp", index: 1, link: "https://namu.wiki/w/%EC%95%88%EC%9C%A0%EC%A7%84"),
    CelebrityModel(name: "조유리", description: "걸그룹 IZ*ONE 출신의 대한민국의 가수 겸 배우.", isGender: false, imageName: "https://i.namu.wiki/i/pySjgsO1rPEhAp82Zpni9yDDDkEWSHUeQYKtlbjVq2aGvcpdBz0pyn_ktL6R57TsQ2-fwVGY-wgu9e5ePQfq1j6ZwPesQtRAMlWO3N5--Of_1muL5otkg9wwB8OK_XrSPSENhlwz10zDll6pdnJrEA.webp", index: 1, link: "https://namu.wiki/w/%EC%A1%B0%EC%9C%A0%EB%A6%AC")
  ]
  
  var body: some View {
    NavigationStack {
      List {
        Section(content: {
          ForEach(data) { i in
            NavigationLink(destination: DetailView(
              name: i.name, description: i.description, isGender: i.isGender, imageName: i.imageName, link: i.link
            )) {
              HStack {
                AsyncImage(url: URL(string: i.imageName)!) {
                  image in
                  image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(12.0)
                    .frame(width: 100, height: 100)
                } placeholder: {
                  ProgressView()
                }
                
                VStack {
                  HStack {
                    Image(systemName: i.isGender ? "person" : "person.fill")
                      .resizable()
                      .frame(width: 20, height: 20)
                    
                    Text("\(i.name)")
                      .modifier(StandardCustomFontText())
                    
                    Spacer()
                  }
                  .padding(.bottom, 5)
                  
                  HStack {
                    Text("\(i.description)")
                      .modifier(StandardCustomFontText())
                      .lineLimit(1)
                    Spacer()
                  }
                }
                .padding(.horizontal)
              }
            }
          }
        }, header: {
          Text("Celebrity List")
            .modifier(StandardCustomFontText())
            .bold()
            .padding(.vertical)
        })
      }
    }
  }
}


#Preview {
  ContentView()
}

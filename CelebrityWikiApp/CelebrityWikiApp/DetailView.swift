//
//  DetailView.swift
//  CelebrityWikiApp
//
//  Created by seobe22 on 11/2/23.
//

import SwiftUI

struct CelebrityData: Codable, Identifiable {
  var id: String
  var name: String
  var description: String
  var imageName: String
  var detailLink: String
}

struct DetailView: View {
  @State private var isImageTapped = false
  
  var name: String
  var description: String
  var isGender: Bool
  var imageName: String
  var link: String
  
  var body: some View {
    Form {
      Section {
        HStack {
          Spacer()
          ZStack {
            AsyncImage(url: URL(string: imageName)!) {
              image in
              image
                .resizable()
                .aspectRatio(contentMode: .fit)
                .cornerRadius(12.0)
                .frame(width: isImageTapped ? UIScreen.main.bounds.width : 200)
            } placeholder: {
              ProgressView()
            }
            .onTapGesture {
              withAnimation(.bouncy) {
                isImageTapped.toggle()
              }
            }
          }
          Spacer()
        }
        
        InformationRow(head: "이름", content: name)
        InformationRow(head: "간단설명", content: description)
        InformationRow(head: "상세정보", link: link)
        
      } header: {
        Text("CELEBRITY DETAIL")
      }
    }
  }
}

struct InformationRow: View {
  var head: String
  var content: String = ""
  var link: String? = nil
  
  var body: some View {
    VStack(alignment: .leading){
      if head == "상세정보", let url = link {
        Link(head, destination:URL(string: url)!)
      } else {
        Text(head)
          .font(.headline)
          .padding(.bottom, 5)
        
        Text(content)
          .font(.body)
      }
    }
  }
}

#Preview {
  DetailView(name: "김세정", description: "연예인", isGender: false, imageName: "https://i.namu.wiki/i/jRkpsWUzbWhu9-SjO1JbAVxkf0PIQYEUFIFXPapX0hDmW0slu6eu8SDVnM8YuDTI-KB-01gA3mSpc5t7oiWreY6TuEuC-nVtYRlsUxUBP2juTWyjwt7FaWg7hnIDiJRyIuFTSq62PJibGM4vtogiMA.webp", link: "https://namu.wiki/w/%EA%B9%80%EC%84%B8%EC%A0%95")
}



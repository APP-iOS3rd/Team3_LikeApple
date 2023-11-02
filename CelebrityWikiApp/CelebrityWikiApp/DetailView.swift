//
//  DetailView.swift
//  CelebrityWikiApp
//
//  Created by seobe22 on 11/2/23.
//

import SwiftUI

struct DetailView: View {
    @Environment(\.dismiss) private var dismiss
    
    @State private var isImageTapped = false
    
    var celebrityInfo: CelebrityModel
    
    var body: some View {
        VStack {
            HStack {
                Button(action: {dismiss()}, label: {
                    Text("< Back")
                        .modifier(StandardCustomFontText())
                        .bold()
                })
                Spacer()
                
            }
            .padding(.horizontal, 20)
            
            Form {
                Section {
                    HStack {
                        Spacer()
                        ZStack {
                            AsyncImage(url: URL(string: celebrityInfo.imageName)!) {
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
                    InformationRow(head: "Name", content: celebrityInfo.name)
                    InformationRow(head: "description", content: celebrityInfo.description)
                    InformationRow(head: "link", link: celebrityInfo.link)
                    
                } header: {
                    Text("CELEBRITY DETAIL")
                        .modifier(StandardCustomFontText())
                        .bold()
                        .padding(.vertical)
                }
            }
        }
        .navigationBarBackButtonHidden()
        .padding(.top, 20)
    }
}

struct InformationRow: View {
    var head: String
    var content: String = ""
    var link: String? = nil
    
    var body: some View {
        VStack(alignment: .leading){
            if head == "link", let url = link {
                Link("Link", destination:URL(string: url)!)
            } else {
                Text(head)
                    .font(.headline)
                    .padding(.bottom)
                Text(content)
                    .font(.body)
            }
        }
        .padding()
    }
}




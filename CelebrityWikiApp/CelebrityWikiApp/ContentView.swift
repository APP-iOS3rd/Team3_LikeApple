//
//  ContentView.swift
//  CelebrityWikiApp
//
//  Created by seobe22 on 11/2/23.
//
import SwiftUI

struct ContentView: View {
    
    @StateObject var celebrityVM: CelebrityViewModel
    
    @State private var isShowModal: Bool = false
    @State private var searchKeyword: String = ""
    
    var result: [CelebrityModel] {
        if searchKeyword.isEmpty { return celebrityVM.celebrityList } else {
            return celebrityVM.celebrityList.filter { $0.name.contains(searchKeyword)}
        }
    }
    
    var body: some View {
        NavigationStack {
            List {
                Section(content: {
                    ForEach(result) { i in
                        NavigationLink(destination: DetailView(celebrityInfo: i)) {
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
                                        Image(systemName: "person.fill")
                                            .resizable()
                                            .frame(width: 20, height: 20)
                                        
                                        Text("\(i.name)")
                                            .modifier(StandardCustomFontText())
                                        
                                        Spacer()
                                    }
                                    .padding(.bottom, 5)
                                    
                                    HStack {
                                        Text("\(i.description)")
                                            .font(.custom("NotoSansKR-Regular", size: 15))
                                            .foregroundStyle(.black)
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
            .toolbar(content: {
                Button(action: {isShowModal = true}, label: {
                    Text("Add")
                        .modifier(StandardCustomFontText())
                        .bold()
                })
                .padding(.trailing, 20)
                .sheet(isPresented: $isShowModal) {
                    AddNewCeleb(celebrityVM: celebrityVM)
                }
            })
            .searchable(text: $searchKeyword, placement: .navigationBarDrawer(displayMode: .always))
        }
    }
}


#Preview {
    ContentView(celebrityVM: CelebrityViewModel())
}

//
//  ContentView.swift
//  CelebrityWikiApp
//
//  Created by seobe22 on 11/2/23.
//

/*
 List {
     Section(content: {
         ForEach(0..<carVM.cars.count, id: \.self) { i in
             NavigationLink(destination: ListNaviDetail(selectedCar: carVM.cars[i]), label: {
                 ListCell(car: carVM.cars[i])
             })
         }
     },header: {
         Text("Car Type")
             .font(.custom("NotoSansKR-Bold", size: 20))
             .foregroundStyle(.black)
             .bold()
     })
 }
 */

import SwiftUI

struct ContentView: View {
    
    @StateObject var celebrityVM: CelebrityViewModel = CelebrityViewModel()
    
    var body: some View {
        NavigationStack {
            List {
                Section(content: {
                    ForEach(celebrityVM.celebrityList) { i in
                        NavigationLink(destination: DetailView()){
                            HStack {
                                Image("\(i.imageName)")
                                    .resizable()
                                    .frame(width: 100, height: 100)
                                    .cornerRadius(5)
                                    .padding(.vertical)
                                
                                VStack {
                                    HStack {
                                        if i.isGender {
                                            Image(systemName: "person")
                                                .resizable()
                                                .frame(width: 30, height: 30)
                                        } else {
                                            Image(systemName: "person.fill")
                                                .resizable()
                                                .frame(width: 20, height: 20)
                                        }
                                        
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
        .onAppear(perform: {
            celebrityVM.celebrityList.append(CelebrityModel(name: "karina", description: "설명중~~~~", isGender: false, imageName: "cute", index: 0, link: ""))
            celebrityVM.celebrityList.append(CelebrityModel(name: "IU", description: "마시멜로우", isGender: false, imageName: "", index: 1, link: ""))
            celebrityVM.celebrityList.append(CelebrityModel(name: "Yuri", description: "조유리입낟ㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏ", isGender: false, imageName: "cute", index: 2, link: ""))
        })
    }
}


#Preview {
    ContentView()
}

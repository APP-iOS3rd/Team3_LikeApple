//
//  ContentView.swift
//  CelebrityWikiApp
//
//  Created by seobe22 on 11/2/23.
//

import SwiftUI
import Combine

struct ContentView: View {
    @State var listData1: [femaleCelebrity] = [
        femaleCelebrity(celebrityName:"연애인 이름 1", imageName:"person.2.fill")
    ]
    var body: some View {
        NavigationStack {
            List(listData1){ item in
                Section(header: Text("여자 연애인 리스트")){
                    NavigationLink(destination:SecondView()){
                        Text(item.celebrityName)
                    }
                }
                Section(header: Text("남자 연애인 리스트")){
                    NavigationLink(destination:SecondView()){
                        Text(item.celebrityName)
                    }
                }
                }
            }
        }
    }


#Preview {
    ContentView()
}

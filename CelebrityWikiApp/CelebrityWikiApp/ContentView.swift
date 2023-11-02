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

struct SecondView: View {
    var body: some View {
        Text("Second View")
    }
}
struct femaleCelebrity : Identifiable{
    var id = UUID()
    var celebrityName : String
    var imageName : String
}

func loadJson<T: Decodable>(_ filename: String) -> T {
    let data: Data

    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
    else {
        fatalError("\(filename) not found.")
    }

    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Could not load \(filename): \(error)")
    }

    do {
        return try JSONDecoder().decode(T.self, from: data)
    } catch {
        fatalError("Unable to parse \(filename): \(error)")
    }

}

#Preview {
    ContentView()
}

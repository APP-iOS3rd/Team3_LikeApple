//
//  CelebrityViewModel.swift
//  CelebrityWikiApp
//
//  Created by 노주영 on 2023/11/02.
//

import Foundation

class CelebrityViewModel: ObservableObject {
    @Published var celebrityList: [CelebrityModel] = []
    
    //Json 파싱
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
}

//
//  CelebrityModel.swift
//  CelebrityWikiApp
//
//  Created by 노주영 on 2023/11/02.
//

import Foundation

struct CelebrityModel: Identifiable, Hashable {
    var id = UUID()                        //아이디
    var name: String                       //연예인 이름
    var description: String                //상세 설명
    var imageName: String                  //이미지 이름
    var index: Int                         //배열 순서(삭제 및 무빙에 사용)
    var link: String                       //나무위키 링크
    
    init(name: String, description: String, imageName: String, index: Int, link: String) {
        self.name = name
        self.description = description
        self.imageName = imageName
        self.index = index
        self.link = link
    }
}

struct QuizModel: Hashable {
    var id = UUID()
    var blur: Int = 0
    var answer: String = ""
    var resultText: String = ""
    
    init(blur: Int, answer: String, resultText: String) {
        self.blur = blur
        self.answer = answer
        self.resultText = resultText
    }
}

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
    var isGender: Bool                     //성별(false: 여자, true: 남자)
    var imageName: String                  //이미지 이름
    var index: Int                         //배열 순서(삭제 및 무빙에 사용)
    var link: String                       //나무위키 링크
    
    init(name: String, description: String, isGender: Bool, imageName: String, index: Int, link: String) {
        self.name = name
        self.description = description
        self.isGender = isGender
        self.imageName = imageName
        self.index = index
        self.link = link
    }
}

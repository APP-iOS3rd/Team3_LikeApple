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
    var detail: String                     //상세 설명
    var imageName: String                  //이미지 이름
    var index: Int                         //배열 순서(삭제 및 무빙에 사용)
    var link: String                       //나무위키 링크
}

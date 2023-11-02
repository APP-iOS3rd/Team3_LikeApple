//
//  CustomModifier.swift
//  CelebrityWikiApp
//
//  Created by 노주영 on 2023/11/02.
//

import SwiftUI

struct StandardCustomFontText: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.custom("NotoSansKR-Regular", size: 20))
            .foregroundStyle(.black)
    }
}

struct StandardCustomFontTitle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.custom("NotoSansKR-Bold", size: 35))
            .foregroundStyle(.black)
            .bold()
    }
}

//
//  CheckListName.swift
//  Assigment1Mileston2
//
//  Created by Heang Sok on 29/3/2022.
//

import Foundation

struct TitleOfEachChecklist:Identifiable, Codable {
    var id = UUID()
    var title: String
    
    init(title: String) {
        self.title = title
    }
}

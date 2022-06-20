//
//  Item.swift
//  Assigment1Mileston2
//
//  Created by Heang Sok on 28/3/2022.
//


import Foundation

struct Item: Identifiable, Codable {
    var id = UUID()
    var itemName:String
    var isTicked: Bool
//    var itemTitle: String
    
    init(itemName: String, isTicked: Bool) {
        self.itemName = itemName
        self.isTicked = isTicked
//        self.itemTitle = itemTitle
    }
}

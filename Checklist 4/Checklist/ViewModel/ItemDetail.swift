//
//  ItemDetail.swift
//  Assigment1Mileston2
//
//  Created by Heang Sok on 29/3/2022.
//

import Foundation

class ItemDetail: ObservableObject, Identifiable, Codable {
    // this line of code tells swiftui to update at runtime
    // this line of code allows you to change the value in a struct Item even it is immutable
    
    @Published var item: Item
    
    init(item: Item){
        self.item = item
    }
    enum CodingKeys: CodingKey {
        case item
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        item = try container.decode(Item.self, forKey: .item)

    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(item, forKey: .item)

    }
    
}


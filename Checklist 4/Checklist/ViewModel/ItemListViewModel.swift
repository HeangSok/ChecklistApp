//
//  ItemListViewModel.swift
//  Assigment1Mileston2
//
//  Created by Heang Sok on 28/3/2022.
//

import Foundation

class ItemListViewModel: ObservableObject, Identifiable, Codable{
    // this line of code tells swiftui to update at runtime
    // this line of code allows you to change the value in a struct Item even it is immutable
    @Published var itemLists = [ItemViewModel]()

    enum CodingKeys: CodingKey {
        case itemLists
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        itemLists = try container.decode([ItemViewModel].self, forKey: .itemLists)

    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(itemLists, forKey: .itemLists)

    }
}

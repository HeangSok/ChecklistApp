//
//  ItemViewModel.swift
//  Assigment1Mileston2
//
//  Created by Heang Sok on 28/3/2022.
//

import Foundation

class ItemViewModel: ObservableObject, Identifiable, Codable {
    // this line of code tells swiftui to update at runtime
    // this line of code allows you to change the value in a struct Item even it is immutable
    @Published var titleOfEachChecklist: TitleOfEachChecklist
    @Published var itemDetails = [ItemDetail]()
    
    enum CodingKeys: CodingKey {
        case titleOfEachChecklist, itemDetails
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        titleOfEachChecklist = try container.decode(TitleOfEachChecklist.self, forKey: .titleOfEachChecklist)
        itemDetails = try container.decode([ItemDetail].self, forKey: .itemDetails)
        
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(titleOfEachChecklist, forKey: .titleOfEachChecklist)
        try container.encode(itemDetails, forKey: .itemDetails)
    }

    init( titleOfEachChecklist:TitleOfEachChecklist) {
        
        self.titleOfEachChecklist = titleOfEachChecklist

    }
    
}

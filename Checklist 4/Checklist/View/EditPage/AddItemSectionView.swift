//
//  AddItemSectionView.swift
//  Assigment1Mileston2
//
//  Created by Heang Sok on 29/3/2022.
//

import SwiftUI

struct AddItemSectionView: View {
    @ObservedObject var itemViewModel: ItemViewModel
    
    @Binding var resetButtonIsClicked: Bool
    
    var body: some View {
        Section{
            ForEach(Array(itemViewModel.itemDetails.enumerated()), id: \.offset) { index, itemDetail in
                ItemDetailInEditPageView(itemDetail: itemDetail, itemViewModel: itemViewModel, resetButtonIsClicked: $resetButtonIsClicked, index: index)
                
                }
            .onDelete{
                itemViewModel.itemDetails.remove(atOffsets: $0)
                ContentView.save()
            }
            .onMove{ (indices, destination) in
                itemViewModel.itemDetails.move(fromOffsets: indices, toOffset: destination)
                ContentView.save()
            }
            
            AddItemView(itemViewModel: itemViewModel)
            
        } header: {
            Text("Add Item And Press Enter")
                .font(.system(size: 15, weight: .semibold, design: .default))
        }
    }

}



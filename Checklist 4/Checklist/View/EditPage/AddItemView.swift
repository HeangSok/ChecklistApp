//
//  AddItemView.swift
//  Assigment1Mileston2
//
//  Created by Heang Sok on 29/3/2022.
//

import SwiftUI
// AddItemView
struct AddItemView: View {
    @ObservedObject var itemViewModel: ItemViewModel
    
    @State var itemName = ""
    
    var body: some View {
        HStack{
            Image(systemName: "plus.circle")
                .foregroundColor(.green)
                .imageScale(.large)
            TextField("Add Item", text: $itemName)
                .disableAutocorrection(true)
                .onSubmit{
                    // when enter, appedn this value
                    let newItem = 
                    ItemDetail(item: Item(itemName: itemName, isTicked: false))

                    itemViewModel.itemDetails.append(newItem)
                    itemName = ""
                    ContentView.save()
               
                }
        }
    }
}



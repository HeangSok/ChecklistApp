//
//  ChecklistView.swift
//  Assigment1Mileston2
//
//  Created by Heang Sok on 28/3/2022.
//

import SwiftUI

struct ChecklistView: View {
    
    @ObservedObject var itemListViewModel: ItemListViewModel
    
    var body: some View {
        List{
            ForEach(itemListViewModel.itemLists) {itemViewModel in
                ChecklistRowView(itemViewModel: itemViewModel)
                
            }
            .onDelete{
                itemListViewModel.itemLists.remove(atOffsets: $0)
                ContentView.save()
            }
            .onMove{ (indices, destination) in
                itemListViewModel.itemLists.move(fromOffsets: indices, toOffset: destination)
                ContentView.save()
            }
            //<----------->
        }
        .navigationTitle("CheckLists")
        .navigationBarItems(leading: EditButton() // EditButton will auto Edit <-> Done
        , trailing: Button(action:{
            // when I click the +, it append a checklist to my instance of class ArrayOfChecklist
//            let itemViewModel = ItemViewModel(titleOfEachChecklist: TitleOfEachChecklist(title: "Checklist"), itemDetails: [ItemDetail(item: Item(itemName: "", isTicked: false))])
            
            let itemViewModel = ItemViewModel(titleOfEachChecklist: TitleOfEachChecklist(title: "Checklist"))
            itemListViewModel.itemLists.append(itemViewModel)
            ContentView.save()
            
        }, label: {
            Image(systemName: "plus")
        }))
        //<---closed bracket for body view--->
    }
    //<-------------Function---------------->
    // Make a function for Edit button to delete checklist by its index
    func removeLists(at offsets: IndexSet) {
        itemListViewModel.itemLists.remove(atOffsets: offsets)
    }
    
    
}



//
//  ChecklistRowView.swift
//  Assigment1Mileston2
//
//  Created by Heang Sok on 29/3/2022.
//

import SwiftUI

struct ChecklistRowView: View {
    @ObservedObject var itemViewModel: ItemViewModel
    
    
    var body: some View {
        NavigationLink("\(itemViewModel.titleOfEachChecklist.title)"){ // the ("\(itemList.title)") will be shown in the parent screen; click on it => new screen
            ItemListView(itemViewModel: itemViewModel)
//                .navigationTitle("\(itemViewModel.titleOfEachChecklist.title)")
        }
    }
}



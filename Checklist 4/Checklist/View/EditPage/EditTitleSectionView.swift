//
//  EditTitleSectionView.swift
//  Assigment1Mileston2
//
//  Created by Heang Sok on 29/3/2022.
//

import SwiftUI

// Edit title section view

struct EditTitleSectionView: View {
    @ObservedObject var itemViewModel: ItemViewModel
    var body: some View {
        Section{
                HStack{
                    Image(systemName: "heart.text.square")
                        .foregroundColor(.green)
                        .imageScale(.large)
                        
                    TextField("\(itemViewModel.titleOfEachChecklist.title)", text: $itemViewModel.titleOfEachChecklist.title)
                        .font(.system(size: 30, weight: .bold, design: .default))
                        .disableAutocorrection(true)
                        .onChange(of: itemViewModel.titleOfEachChecklist.title){newValue in
                            ContentView.save()
                        }

                }.frame(height: 75, alignment: .bottomLeading)
    // set header of each section
        }
//    header: {
//            Text("Change Title And Press Enter:")
//                .font(.system(size: 15, weight: .semibold, design: .default))
//        }
    }
}



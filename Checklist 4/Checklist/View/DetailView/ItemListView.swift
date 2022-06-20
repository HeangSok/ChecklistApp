//
//  ItemList.swift
//  Assigment1Mileston2
//
//  Created by Heang Sok on 29/3/2022.
//

import SwiftUI

struct ItemListView: View {
    @ObservedObject var itemViewModel: ItemViewModel
    
    @State var editButtonIsClicked = false
    @State var resetButtonIsClicked = false
    
    @State var editMode: EditMode = .inactive
    
    var body: some View {
        List{
            
            if !editButtonIsClicked{
                ForEach(itemViewModel.itemDetails){itemDetail in
                    // Item detail page
                    ItemDetailView(itemDetail: itemDetail)
                }.onDelete{indexSet in
                    itemViewModel.itemDetails.remove(atOffsets: indexSet)
                    ContentView.save()
                }
            } else {
                //Edit page
                    EditTitleSectionView(itemViewModel: itemViewModel)
                    AddItemSectionView(itemViewModel: itemViewModel, resetButtonIsClicked: $resetButtonIsClicked)
            }
        }
        // this line of code need to put in a list that wrape the ForEach loop that have onDelete and onMove-
        // to trigger both of them without using the EndButton()
        .environment(\.editMode, Binding.constant(self.editMode))
//        .navigationBarTitleDisplayMode(editButtonIsClicked ? .inline : .large)
        .navigationBarTitle(editButtonIsClicked ? "" : "\(itemViewModel.titleOfEachChecklist.title)")
//        .navigationBarBackButtonHidden(editButtonIsClicked ? true : false)
        .toolbar{
            ToolbarItemGroup(placement: .navigationBarTrailing){
                if !editButtonIsClicked{
                    Button(action:{editButtonIsClicked = !editButtonIsClicked
                        
                        self.editMode = self.editMode == .active ? .inactive : .active
                        print("editButton is click")
                    }, label: {Text("Edit")})
                } else {
                    
                    if !resetButtonIsClicked{
                        Button(action: {self.resetButtonIsClicked = !self.resetButtonIsClicked
                        // then do sth else
//                        print(resetButtonIsClicked)
                            
                    }, label: {Text("Reset").foregroundColor(.red)})
                        
                    } else {
                        Button(action: {self.resetButtonIsClicked = !self.resetButtonIsClicked
                        // then do sth else
//                        print(resetButtonIsClicked)
                    }, label: {Text("Undo Reset").foregroundColor(.green)})
                        
                    }

                    Button(action: {editButtonIsClicked = !editButtonIsClicked
                        // then do something
                        if resetButtonIsClicked == true {
                            for item in itemViewModel.itemDetails{
                                item.item.isTicked = false
                                
                            }
                            ContentView.save()
                        }
                        self.resetButtonIsClicked = false
                        self.editMode = self.editMode == .active ? .inactive : .active
                        print("done is clicked")
                        print(editButtonIsClicked)

                    }, label: {Text("Done")})
                    
                }
            }
        }
    }
}


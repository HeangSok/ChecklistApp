//
//  ItemListInEditPageView.swift
//  Assigment1Mileston2
//
//  Created by Heang Sok on 29/3/2022.
//

import SwiftUI

struct ItemDetailInEditPageView: View {
    @ObservedObject var itemDetail: ItemDetail
    @ObservedObject var itemViewModel: ItemViewModel

    //<>
    @Binding var resetButtonIsClicked: Bool
    @State var index:Int
    
    
    var body: some View {
        
        HStack {
            // note: all the comments here can be deleted in milestone3; however, this student decided to keep it for future reference
            // the reason why we use the onTabGesture here is because if you place two button in a list
            // and when you table one button, another button will be triggerd as well
            // in this source code, I just use onTabGesture with
            
//            Button(action: {}, label: {Image(systemName: "minus.circle.fill")
//                    .foregroundColor(.red)
//                    .imageScale(.large)}).onTapGesture {
//                        itemViewModel.itemDetails.remove(at: index)
//            ChecklistApp.save()
//                    }
            Button(action: {
                // if the resetButtonIsClicked is click, don't change the state of itTicked
                if !resetButtonIsClicked{
                    itemDetail.item.isTicked = !itemDetail.item.isTicked}
                    ContentView.save()
                // then do something
            }){
                // if the resetButtonIsClicked is click, don't show the checkmark
                if !resetButtonIsClicked{
                HStack{
                    Text("\(itemDetail.item.itemName)")
                    Spacer()
                    Image(systemName: itemDetail.item.isTicked ? "checkmark": "")
                        .renderingMode(.original)
                        .resizable()
                        .foregroundColor(.blue)
                        .frame(width: 22, height: 22)

                }
                } else {
                    Text("\(itemDetail.item.itemName)")
                }
            }
        }
    }
}


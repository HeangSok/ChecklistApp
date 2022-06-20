//
//  ItemDetailView.swift
//  Assigment1Mileston2
//
//  Created by Heang Sok on 29/3/2022.
//

import SwiftUI

struct ItemDetailView: View {
    @ObservedObject var itemDetail: ItemDetail
    
    var body: some View {
        Button(action: {itemDetail.item.isTicked = !itemDetail.item.isTicked
            ContentView.save()
            // then do something
        }){
            HStack{
                Text("\(itemDetail.item.itemName)")
                Spacer()
                Image(systemName: itemDetail.item.isTicked ? "checkmark": "")
                    .renderingMode(.original)
                    .resizable()
                    .foregroundColor(.blue)
                    .frame(width: 22, height: 22)
            }
        }
    }
}



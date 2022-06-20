//
//  ContentView.swift
//  Assigment1Mileston2
//
//  Created by Heang Sok on 28/3/2022.
//

import SwiftUI

struct ContentView: View {
    @State var isLoading = true
    @ObservedObject var itemListViewModel: ItemListViewModel = ContentView.itemListViewModel

    // <---------decode-the-json-file--------->
    static var itemListViewModel: ItemListViewModel = {
        guard let data = try? Data(contentsOf: ContentView.fileURL),
              let itemListViewModel = try? JSONDecoder().decode(ItemListViewModel.self, from: data)
                
        else{
            print("false")
            return itemListViewModel
        }
        return itemListViewModel
    }()
    
    // <--------set-the-path-to-save-the-json-file-------->
    static var fileURL: URL {
        let fileName = "checklists.json"
        let fm = FileManager.default
        guard let documentDir = fm.urls(for: .documentDirectory, in: .userDomainMask).first else { return URL(fileURLWithPath: "/") }
        let fileURL = documentDir.appendingPathComponent(fileName)
        print(fileURL)
        return fileURL
    }
        
    var body: some View {
        NavigationView{
            if isLoading{
                withAnimation{
                    VStack(alignment: .center){
                        ProgressView{
                            Text("Loading...")
                                .font(.title2)
                        }
                        .progressViewStyle(DarkBlueShadowProgressViewStyle())
                    }
                    .frame(width: 125, height: 125, alignment: .center)
                    .background(RoundedRectangle(cornerRadius: 25).stroke(.gray,lineWidth: 2))
                }

            }else{
                ChecklistView(itemListViewModel: itemListViewModel)
            }
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                isLoading = false
            }
        }
    }
    
    // <---------save function------------->
    static func save() {

    do {
        let data = try JSONEncoder().encode(itemListViewModel)
        try data.write(to: fileURL, options: .atomic)
        guard let dataString = String(data: data, encoding: .utf8) else { return }
        print(dataString)
    } catch {
        print("Could not write file: \(error)")
    }
}

}
// this struct is taken from Apple's Documentation; used to customise ProgessViewStyle
 struct DarkBlueShadowProgressViewStyle: ProgressViewStyle {
     func makeBody(configuration: Configuration) -> some View {
         ProgressView(configuration)
             .shadow(color: Color(red: 0, green: 0, blue: 0.6),
                     radius: 4.0, x: 1.0, y: 2.0)
     }
 }

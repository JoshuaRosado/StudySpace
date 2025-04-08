//
//  AddNotesView.swift
//  StudySpace
//
//  Created by Joshua Rosado Olivencia on 4/7/25.
//

import SwiftUI
import UIKit



struct AddNotesView: View {
    
    init() {
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor.cremeBrulee]}
    
    @State private var title: String = ""
    @State private var content: String = ""
    @State private var date: Date = .now
    var body: some View {
        NavigationStack{
            Form{
                Section{
                    TextField("Title", text:$title)
                        .fontWeight(.bold)
                        .padding(.vertical,4)
                        
                        
     
                }
                
                Section{
                    TextEditor(text: $content)

                        .frame(minHeight: 200)

                }
                .toolbar{
                    Button("Add", systemImage: "plus"){
                        
                    }
                }
                
                
            }
            .fontDesign(.monospaced)
            .navigationTitle("Add Notes")
            .navigationBarTitleDisplayMode(.inline)
            .scrollContentBackground(.hidden)
            .background(.auLait.opacity(0.2))
            
        }
        
        
    }
}

#Preview {
    AddNotesView()
}

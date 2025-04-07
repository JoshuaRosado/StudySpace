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
                Section("Title"){
                    TextField("Title", text:$title )
                }
                Section("Notes"){
                    TextEditor(text: $content)
                }
            }
            .navigationTitle("Add Notes")
            .navigationBarTitleDisplayMode(.inline)
            .scrollContentBackground(.hidden)
            .background(Color.wholeWheat)
        }
        
        
    }
}

#Preview {
    AddNotesView()
}

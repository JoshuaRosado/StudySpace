//
//  AddNotesView.swift
//  StudySpace
//
//  Created by Joshua Rosado Olivencia on 4/7/25.
//
import SwiftData
import SwiftUI
import UIKit



struct AddNotesView: View {
    
    init() {
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor.cremeBrulee]}
    
    @Query(sort: \Note.date) var notes: [Note]
    @Environment(\.modelContext) var modelContext
    @Environment(\.dismiss) var dismiss
    
    
    @State private var title: String = ""
    @State private var content: String = ""
    @State private var date: Date = Date.now
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
                    Button("add"){
                        // create new note
                        let newNotes = Note(title: title, content: content, date: date)
                        // added to the model array
                        modelContext.insert(newNotes)
                        // close view and return home
                        dismiss()
                        
                        
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

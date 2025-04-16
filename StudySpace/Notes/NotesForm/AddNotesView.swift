//
//  AddNotesView.swift
//  StudySpace
//
//  Created by Joshua Rosado Olivencia on 4/7/25.
//
import SwiftData
import SwiftUI
import UIKit


extension String {
    var isReallyEmpty : Bool {
        return self.trimmingCharacters(in: .whitespaces).isEmpty
    }
}

struct AddNotesView: View {
    
    init() {
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor.cremeBrulee]}
    
    @Query(sort: \Note.date) var notes: [Note]
    @Environment(\.modelContext) var modelContext
    @Environment(\.dismiss) var dismiss
    
    
    @State private var title: String = ""
    @State private var content: String = ""
    @State private var date: Date = Date.now
    
    
    
    var validatingInput: Bool {
        if title.isReallyEmpty || content.isReallyEmpty {
            return false
        }
        return true
    }
    var body: some View {
        VStack{
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
            
                
                
            }
            Button("", systemImage:"plus"){
                // create new note
                let newNotes = Note( title: title, content: content, date: date)
                // added to the model array
                modelContext.insert(newNotes)
                // close view and return home
                dismiss()
                    
                
                
            }
            .foregroundStyle(validatingInput ? .blue: .secondary)
            .buttonStyle(.plain)
            
            .disabled(!validatingInput)
        }
        .fontDesign(.monospaced)
        .scrollContentBackground(.hidden)
        .background(.auLait.opacity(0.2))
        
        
        
    }
    
}

#Preview {
    AddNotesView()
}

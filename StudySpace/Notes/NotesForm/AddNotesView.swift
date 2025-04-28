//
//  AddNotesView.swift
//  StudySpace
//
//  Created by Joshua Rosado Olivencia on 4/7/25.
//
import SwiftData
import SwiftUI
import UIKit


// extension for TextField Validation making sure no empty or empty space value is allowed to be submitted
extension String {
    var isReallyEmpty : Bool {
        return self.trimmingCharacters(in: .whitespaces).isEmpty
    }
}

struct AddNotesView: View {
    
  
    @State private var path = [Note]()
    @Bindable var note: Note
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
                        TextField("Title", text:$note.title)
                            .fontWeight(.bold)
                            .padding(.vertical,4)
                        
                        
                    }
                    
                    Section{
                        TextEditor(text: $note.content)
                        
                            .frame(minHeight: 200)
                        
                    }
                    
                    
                }
                
                
            }
            .fontDesign(.monospaced)
            .scrollContentBackground(.hidden)
            .background(.auLait.opacity(0.2))
            
//            .toolbar{
//                Button("",systemImage: "plus"){
//                    // Create new note
//                    let note = Note(title: "", content: "", date: .now)
//                    // Add to our model
//                    guard validatingInput else {return}
//                    modelContext.insert(note)
//                    // Add to our path to display in list
//                    path.append(note)
//
//                    
//                }
                }
            }
            
            
            

    
    


#Preview {
    do {
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        let container = try ModelContainer(for: Note.self, configurations: config)
        let note = Note(title: "Food List", content: "Eggs, Bacon, Bananas, Apples", date: .now)
        return AddNotesView(note: note)
            .modelContainer(container)
    }
    catch {
        return Text("Failed to create container: \(error.localizedDescription)")
    }
}   

//
//  NotesView.swift
//  StudySpace
//
//  Created by Joshua Rosado Olivencia on 4/4/25.
//
import SwiftData
import SwiftUI

struct NotesView: View {
    // create our var for model
    @Environment(\.modelContext) var modelContext
    let arrs = [ "Hello", "Hola", "Ciao", "Konichiwa"]
    //return the data sorted by date
        // var type : Array of Note class model
    @Query(sort: \Note.date) var notes: [Note]
    
//    let note: Note
    
    var body: some View {
        NavigationStack{
            ZStack{
                Color.cream.ignoresSafeArea()
                
                VStack(alignment: .leading, spacing: 20){
                    List{
                        ForEach(arrs, id: \.self){ arr in
                            Text(arr)
                                .font(.headline)
                            Text(arr)
                                .font(.body)
                        }
                    }
                }
                
                
            }
        }
    }
}

#Preview {
    NotesView()
}

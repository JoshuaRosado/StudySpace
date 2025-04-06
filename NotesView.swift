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
    
    // ======== SAMPLE ARRAY FOR PREVIEW
    let arrs = [ "Hello", "Hola", "Ciao", "Konichiwa"]
    // ==================================
    //return the data sorted by date
        // var type : Array of Note class model
    @Query(sort: \Note.date) var notes: [Note]
    
//    let note: Note
    
    var body: some View {
        NavigationStack{
            ZStack{
                Color.wholeWheat.ignoresSafeArea()
                
                VStack{
                    List{
                        ForEach(arrs, id: \.self){ arr in
                            HStack{
                                Text(arr)
                                    .font(.headline)
                                    .fontWeight(.bold)
                                    
                                Spacer()
                                Text(arr)
                                    .font(.subheadline)
                                    .foregroundStyle(Color("eucalyptus")).opacity(0.5)
                            }
                            .fontDesign(.monospaced)
                        }
                        
                        .listRowBackground(Color.wholeWheat).brightness(-0.1)
//                        .listRowSeparator(.hidden)
                    }
                    // Hide background to Add customize background
                    .scrollContentBackground(.hidden)
                
                    
                }
                .foregroundStyle(Color("eucalyptus"))
                .shadow(color: Color("cremeBrulee").opacity(0.4), radius: 2, x: 2, y: 2)
                
                
            }
            
            .navigationTitle("My Notes")
            .navigationBarTitleDisplayMode(.inline)
            
            .toolbar{
                Button("Add Notes" ,systemImage: "plus"){
                    
                }
            }
            
        }
        
        
    }
    
}

#Preview {
    NotesView()
}

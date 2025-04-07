//
//  NotesView.swift
//  StudySpace
//
//  Created by Joshua Rosado Olivencia on 4/4/25.
//
import SwiftData
import SwiftUI


struct NotesView: View {
    // Customizing NavigationTitle's foregroundColor
    init() {
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor.cremeBrulee]}
    
    // create our var for model
    @Environment(\.modelContext) var modelContext
    
    // ==================================
    //return the data sorted by date
    // var type : Array of Note class model
    @Query(sort: \Note.date) var notes: [Note]
    
    
    
    // ======== SAMPLE ARRAY FOR PREVIEW
    let arrs = [ "Hello", "Hola", "Ciao", "Konichiwa"]
    
    @State private var openAddNotesView: Bool = false

    
    //    let note: Note
    
    var body: some View {
        NavigationStack{
            ZStack{
                
                // Bottom object----
                Color.wholeWheat.ignoresSafeArea()
                
                // Top object----
                VStack{
                    // Display a list of all the created Notes
                    List{
                        // For each one of the notes
                        // Display it as following
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
                    }
                    // Hide background to Add customize background
                    .scrollContentBackground(.hidden)
                }
                .foregroundStyle(Color("eucalyptus"))
                .shadow(color: Color("cremeBrulee").opacity(0.4), radius: 2, x: 2, y: 2)
                
                
            }
            .navigationTitle("My Notes")
            .navigationBarTitleDisplayMode(.inline)
            
            // Toolbar with add notes "plus" button to redirect to the form of creating new notes and adding them to the list displayed
            .toolbar{
                Button("Add Notes" ,systemImage: "plus"){
                    openAddNotesView.toggle()
                    
                    
                }
            }
            
            .sheet(isPresented: $openAddNotesView){
                AddNotesView()
            }
        }
    }
}

#Preview {
    NotesView()
}

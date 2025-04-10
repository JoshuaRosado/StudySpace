//
//  NotesView.swift
//  StudySpace
//
//  Created by Joshua Rosado Olivencia on 4/4/25.
//
import SwiftData
import SwiftUI


struct NotesView: View {
    
    
    
    //     Customizing NavigationTitle's foregroundColor
    init() {
        
        
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor.cremeBrulee]
    }
    
    // create our var for model
    @Environment(\.modelContext) var modelContext
    
    // ==================================
    //return the data sorted by date
    // var type : Array of Note class model
    @Query(sort: \Note.date, order:.forward) var notes: [Note]
    
    
    
    
    
    @State private var openAddNotesView: Bool = false
    
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
                        ForEach(notes){ note in
                            NavigationLink(value: note){
                                HStack{
                                    Text(note.title)
                                        .font(.headline)
                                        .fontWeight(.bold)
                                    
                                    Spacer()
                                    Text(note.date, style: .date)
                                        .font(.subheadline)
                                        .foregroundStyle(Color("cremeBrulee")).opacity(0.5)
                                }
                            }
                            .fontDesign(.monospaced)
                        }
                        .listRowBackground(Color.wholeWheat).brightness(-0.1)
                    }
                    // Hide background to Add customize background
                    .scrollContentBackground(.hidden)
                    
                    
                    //  Button add notes "plus" button to redirect to the form of creating new notes and adding them to the list displayed
                    Button("Add Notes" ,systemImage: "plus"){
                        openAddNotesView.toggle()
                    }
                    
                }
                .foregroundStyle(Color("cremeBrulee"))
                .shadow(color: Color("cremeBrulee").opacity(0.4), radius: 2, x: 2, y: 2)
                
                
            }
            .navigationTitle("My Notes").fontDesign(.serif)
            .navigationBarTitleDisplayMode(.inline)
            .navigationDestination(for: Note.self){ note in
                
                NotesDetailView(note: note)
                
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

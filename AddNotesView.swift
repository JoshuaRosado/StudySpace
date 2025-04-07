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
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 20).stroke(Color.cremeBrulee.opacity(0.04), lineWidth: 5).fill(.auLait.opacity(0.08)))
     
                }
                
                Section{
                    TextEditor(text: $content)
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 20).stroke(Color.cremeBrulee.opacity(0.04), lineWidth: 5).fill(.auLait.opacity(0.08)))
                        .frame(minHeight: 250)
                        
                        
                }
                
                
            }
            .fontDesign(.monospaced)
            .navigationTitle("Add Notes")
            .navigationBarTitleDisplayMode(.inline)
            .scrollContentBackground(.hidden)
            .background(.white)
            
        }
        
        
    }
}

#Preview {
    AddNotesView()
}

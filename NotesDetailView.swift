//
//  NotesDetailView.swift
//  StudySpace
//
//  Created by Joshua Rosado Olivencia on 4/9/25.
//

import SwiftData
import SwiftUI

struct NotesDetailView: View {
    
    
    

    let note : Note
    var body: some View {
        ZStack{
            Color.wholeWheat.ignoresSafeArea()
            VStack(spacing: 20){
            
                
                Text(note.title).font(.title).fontWeight(.semibold)
                    .frame(width:350, alignment: .leading)
                    
                
                Text(note.content)
                    .frame(width: 350, alignment: .leading)
                    .padding()
                Spacer()
            }
            .frame(width: 400, alignment: .leading)
            .padding(.vertical,20)
            .background(.wholeWheat.opacity(0.5))
            .foregroundStyle(.cremeBrulee)
            .fontDesign(.serif)
        }
    
        
    }
}

//#Preview {
//    NotesDetailView()
//}

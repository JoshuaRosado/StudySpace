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
            VStack(alignment: .leading, spacing: 25){
                
                
                Text(note.title).font(.title).fontWeight(.semibold)
                    .padding(.vertical,15)
                Text(note.content)
                Spacer()
            }
            .background(.wholeWheat.opacity(0.5))
            .shadow(color: Color("cremeBrulee").opacity(0.4), radius: 2, x: 2, y: 2)
            .padding(.horizontal, 25)
            .frame(minWidth: 400, alignment: .leading)
            .foregroundStyle(.cremeBrulee)
            .fontDesign(.serif)
        }
        
    }
}

//#Preview {
//    NotesDetailView()
//}

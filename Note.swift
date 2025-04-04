//
//  Note.swift
//  StudySpace
//
//  Created by Joshua Rosado Olivencia on 4/4/25.
//

import SwiftData
import SwiftUI

@Model
class Note {
    var title: String
    var content: String
    var date : Date
    
    init(title: String, content: String, date: Date) {
        self.title = title
        self.content = content
        self.date = date
    }
    
    
}

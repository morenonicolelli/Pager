//
//  File.swift
//  
//
//  Created by Moreno Nicolelli on 02/07/22.
//

import Foundation
import SwiftUI

enum ExampleSections: String, SectionWrapper {
    case page1
    case page2
    case page3
    case page4
    
    var id: String { String(rawValue) }
    
    var viewToPresent: AnyView {
        switch self {
        case .page1:
            return AnyView(Color.red)
        case .page2:
            return AnyView(Color.blue)
        case .page3:
            return AnyView(Color.green)
        case .page4:
            return AnyView(Color.yellow)
        }
    }
}

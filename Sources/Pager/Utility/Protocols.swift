//
//  File 2.swift
//  
//
//  Created by Moreno Nicolelli on 02/07/22.
//

import Foundation
import SwiftUI

protocol SectionWrapper: CaseIterable, Identifiable, Hashable  {
    var id: String { get }
    var viewToPresent: AnyView { get }
}

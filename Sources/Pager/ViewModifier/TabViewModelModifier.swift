//
//  File 3.swift
//  
//
//  Created by Moreno Nicolelli on 02/07/22.
//

import Foundation
import SwiftUI

public extension TabView {
    func pagerStyle() -> some View {
        self
            .edgesIgnoringSafeArea(.vertical)
            .tabViewStyle(.page)
            .indexViewStyle(.page(backgroundDisplayMode: .never))
            .animation(.easeIn)
            .transition(.slide)
    }
}

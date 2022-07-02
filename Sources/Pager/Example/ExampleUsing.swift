//
//  File.swift
//  
//
//  Created by Moreno Nicolelli on 02/07/22.
//

import SwiftUI

@available(tvOS 15.0, *)
@available(iOS 15.0, *)
struct MomoPagerView_Previews: PreviewProvider {
    static var selection: ExampleSections = .page1
    
    static var previews: some View {
        PagerView(selectionBar: selection,
                  selectionColor: .red,
                  underlineColor: .black,
                      fontType: .title
        )
        .previewInterfaceOrientation(.landscapeLeft)
    }
}


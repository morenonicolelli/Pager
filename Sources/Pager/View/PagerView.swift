//
//  SwiftUIView.swift
//  
//
//  Created by Moreno Nicolelli on 02/07/22.
//

import SwiftUI

struct PagerView<Section: SectionWrapper>: View where Section.AllCases: RandomAccessCollection {
    @State var selectionBar: Section
    let selectionColor: Color
    let underlineColor: Color
    let fontType: Font
    
    var SelectionBar: some View {
        HStack{
            ForEach(Section.allCases, id: \.self) { item in
                Text(item.id.capitalized)
                    .minimumScaleFactor(0.5)
                    .lineLimit(1)
                    .foregroundColor(selectionColor)
                    .frame(maxWidth: .infinity)
                    .font(fontType)
                    .grayscale(selectionBar == item ? 0 : 1)
                    .padding(.bottom, 10)
                    .border(width: 3, edges: [.bottom], color: selectionBar == item ? underlineColor : .white)
                    .onTapGesture {
                        selectionBar = item
                    }
                    .animation(.easeIn, value: selectionBar)
            }
        }
        .padding([.trailing, .leading, .top], 8)
    }
    
    var body: some View {
        VStack(spacing: 0){
            SelectionBar
                TabView(selection: $selectionBar){
                    ForEach(Section.allCases) { item in
                        item.viewToPresent
                            .tag(item)
                    }
                }
                .pagerStyle()
        }
    }
}

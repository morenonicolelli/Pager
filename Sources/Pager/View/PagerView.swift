//
//  SwiftUIView.swift
//  
//
//  Created by Moreno Nicolelli on 02/07/22.
//

import SwiftUI

public struct PagerView<Section: SectionWrapper>: View where Section.AllCases: RandomAccessCollection {
    @State public var selectionBar: Section
    private let selectionColor: Color
    private let underlineColor: Color
    private let fontType: Font
    
    public init(selectionBar: Section, selectionColor: Color, underlineColor: Color, fontType: Font) {
        self.selectionBar = State(initialValue: selectionBar) as! Section
        self.selectionColor = selectionColor
        self.underlineColor = underlineColor
        self.fontType = fontType
    }
    
    public var body: some View {
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
    
    private var SelectionBar: some View {
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
}

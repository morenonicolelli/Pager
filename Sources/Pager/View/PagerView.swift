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
    
    public init<Section: SectionWrapper>(selectionBar: Section,
                                         selectionColor: Color = .black,
                                         underlineColor: Color = .black,
                                         fontType: Font = .body){
        self.selectionBar = selectionBar
        self.underlineColor = underlineColor
        self.selectionColor = selectionColor
        self.fontType = fontType
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
}

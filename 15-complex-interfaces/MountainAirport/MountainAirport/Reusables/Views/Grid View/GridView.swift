//
//  GridView.swift
//  MountainAirport
//
//  Created by CypherPoet on 2/10/20.
// ✌️
//

import SwiftUI
import CypherPoetSwiftUIKit
import Clamping


struct GridView<Item, Content: View> {
    var items: [Item]
    
    @Clamping(wrappedValue: 2, range: 1...Int.max)
    var columnCount: Int
    
    let content: (CGFloat, Item) -> Content
    
    
    init(
        items: [Item] = [],
        columnCount: Int = 2,
        @ViewBuilder content: @escaping ((CGFloat, Item) -> Content)
    ) {
        self.items = items
        self._columnCount.wrappedValue = columnCount
        self.content = content
    }
}


// MARK: - View
extension GridView: View {

    var body: some View {
        GeometryReader { geometry in
            VStack(spacing: 0) {
                ForEach(0 ..< self.rowCount, id: \.self) { row in
                    self.gridRow(at: row, in: geometry)
                }
            }
        }
        .embedInScrollView(axes: .vertical, showsIndicators: false)
    }
}


// MARK: - Computeds
extension GridView {
    var rowCount: Int { ((items.count - 1) / columnCount) + 1 }
}


// MARK: - View Variables
extension GridView {
}


// MARK: - Private Helpers
private extension GridView {
    
    func elementAt(row: Int, column: Int) -> Item? {
        let index = (row * columnCount) + column
        
        guard index < items.count else { return nil }
        
        return items[index]
    }
    
    
    func gridRow(at rowIndex: Int, in geometry: GeometryProxy) -> some View {
        let cellSize: CGFloat = geometry.size.width / CGFloat(columnCount)
        
        return HStack(spacing: 0) {
            ForEach(0 ..< columnCount, id: \.self) { column in
                Group {
                    if self.elementAt(row: rowIndex, column: column) != nil {
                        self.content(
                            cellSize,
                            self.elementAt(row: rowIndex, column: column)!
                        )
                    } else {
                        Spacer()
                    }
                }
                .frame(width: cellSize, height: cellSize)
            }
        }
    }
}



// MARK: - Preview
struct GridView_Previews: PreviewProvider {

    static var previews: some View {
        Group {
            GridView(
                items: [3, 5, 8, 13, 21],
                columnCount: 2
            ) { cellWidth, number in
                VStack {
                    Circle()
                        .fill(Color.purple)
                        .frame(width: 100, height: 100)
//
                    Text("Cell \(number)")
                }
            }

            GridView(
                items: [123],
                columnCount: 1
            ) { _, number in
                Text("Cell \(number)")
            }
        }
    }
}

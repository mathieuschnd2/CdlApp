//
//  CategoriesView.swift
//  CDL
//
//  Created by mathieu schneider on 30.10.23.
//

import Foundation
import SwiftUI

struct CategoriesView: View {
    @Binding var selectedCategory: String
    let categories: [String]
    let onCategorySelected: (String) -> Void
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: true) {
            HStack {
                ForEach(categories, id: \.self) { category in
                    Button(action: {
                        onCategorySelected(category)
                    }) {
                        VStack {
                            Image(systemName: "newspaper.circle")
                                .foregroundColor(selectedCategory == category ? .primary : .gray)
                                .font(.system(size: 30))
                            Text(category)
                                .font(.caption)
                                .foregroundColor(selectedCategory == category ? .primary : .gray)
                        }
                    }
                    .padding(.trailing, 10)
                }
            }
            .padding()
        }
    }
}

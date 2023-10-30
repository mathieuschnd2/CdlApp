//
//  SearchBar.swift
//  CDL
//
//  Created by mathieu schneider on 30.10.23.
//

import Foundation
import SwiftUI

struct SearchBar: View {
    @Binding var text: String
    var placeholder: String

    var body: some View {
        HStack {
            TextField(placeholder, text: $text)
                .padding(7)
                .background(Color(.systemGray6))
                .cornerRadius(8)
            
            Button(action: {
                text = ""
            }) {
                Image(systemName: "xmark.circle.fill")
                    .opacity(text.isEmpty ? 0 : 1)
            }
        }
        .padding(.horizontal)
    }
}

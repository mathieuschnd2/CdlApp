//
//  StudentIDCardView.swift
//  CDL
//
//  Created by mathieu schneider on 30.10.23.
//

import Foundation
import SwiftUI

struct StudentIDCardView: View {
    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    Spacer()

                    // School logo
                    Image("school_logo") // Replace "school_logo" with your image name
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 200, height: 200)

                    Spacer()
                }

                VStack {
                    Spacer()
                    NavigationLink(destination: WebView(urlString: "https://d.pslot.io/t/xSY7ChXFs")) {
                        HStack {
                            Text("Create School Pass")
                                .font(.headline)
                                .font(.system(size: 24))
                                .foregroundColor(.white)
                                .padding(20)
                                .background(Color.yellow)
                                .cornerRadius(100)
                        }
                    }
                    .navigationBarTitle("", displayMode: .inline)

                    Spacer().frame(height: 20) // Adjust the spacing as needed
                }
            }
            .navigationBarTitle("", displayMode: .inline)
        }
    }
}

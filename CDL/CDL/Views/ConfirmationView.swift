//
//  ConfirmationView.swift
//  CDL
//
//  Created by mathieu schneider on 30.10.23.
//

import Foundation
import SwiftUI

struct ConfirmationView: View {
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        VStack {
            Text("Request Sent")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding(.bottom, 10)

            Text("Your change request has been sent successfully.")
                .font(.subheadline)
                .foregroundColor(.secondary)
                .padding(.bottom, 20)
            
            Text("Will take up to 24h maximum for the system to make the Update")
                .font(.headline)
                .foregroundColor(.secondary)
                .padding(.bottom, 20)
            Button(action: {
                self.presentationMode.wrappedValue.dismiss()
            }) {
                Text("done")
                .font(.headline)
                .foregroundColor(.white)
                .padding(20)
                .background(Color.blue)
                .cornerRadius(100)
            }
            .padding()
        }
        .padding()
    }
}

//
//  ChangeRequestDiscordView.swift
//  CDL
//
//  Created by mathieu schneider on 30.10.23.
//

import Foundation
import SwiftUI

struct ChangeRequestDiscordPage: View {
    @State private var name = ""
    @State private var birthday = ""
    @State private var cdlIDNumber = ""
    @State private var grade = ""
    @State private var studentType = ""
    @State private var isConfirmationViewPresented = false

    var body: some View {
        VStack {
            Text("Change Request")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding(.bottom, 10)
            
            Text("Can take up to 24h to make the changes")
                .font(.subheadline)
                .foregroundColor(.secondary)
                .padding(.bottom, 20)
            
            TextField("Full Name (Mandatory)", text: $name)
                .foregroundColor(.gray)
                .padding(15)
                .background(Color(.systemGray6))
                .cornerRadius(20)
            
            TextField("Birthday (optional)", text: $birthday)
                .foregroundColor(.gray)
                .padding(15)
                .background(Color(.systemGray6))
                .cornerRadius(20)
            
            TextField("CDL ID Number (optional)", text: $cdlIDNumber)
                .foregroundColor(.gray)
                .padding(15)
                .background(Color(.systemGray6))
                .cornerRadius(20)
            
            TextField("Grade (optional)", text: $grade)
                .foregroundColor(.gray)
                .padding(15)
                .background(Color(.systemGray6))
                .cornerRadius(20)
            
            TextField("Student Type (optional)", text: $studentType)
                .foregroundColor(.gray)
                .padding(15)
                .background(Color(.systemGray6))
                .cornerRadius(20)
            
            ChangeRequestDiscordView(
                name: $name,
                birthday: $birthday,
                cdlIDNumber: $cdlIDNumber,
                grade: $grade,
                studentType: $studentType,
                isConfirmationViewPresented: $isConfirmationViewPresented
            )
        }
        .padding()
    }
}

struct ChangeRequestDiscordView: View {
@Binding var name: String
@Binding var birthday: String
@Binding var cdlIDNumber: String
@Binding var grade: String
@Binding var studentType: String
@Binding var isConfirmationViewPresented: Bool

var body: some View {
    Button(action: {
        // Create a Discord Webhook payload here
        let payload = """
        {
            "content": "Change Request:\\nName: \(name)\\nBirthday: \(birthday)\\nCDL ID Number: \(cdlIDNumber)\\nGrade: \(grade)\\nStudent Type: \(studentType)"
        }
        """
        print("Payload: \(payload)")

        // Replace 'YOUR_DISCORD_WEBHOOK_URL' with your actual Discord webhook URL
        let webhookURL = URL(string: "https://discord.com/api/webhooks/1155894421791969372/R4abuMQmCqJSO_HYL6O0lT0XATvoSDNETC10y9UeiiaXMut-QpM88eD3Z1UW223BPFAt")!

        // Create an HTTP POST request to the Discord webhook
        var request = URLRequest(url: webhookURL)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = payload.data(using: .utf8)

        // Send the request
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                print("Error sending request: \(error.localizedDescription)")
            } else if let data = data {
                // Parse the response data here, if needed
                print("Request sent successfully")
                print("Response data: \(String(data: data, encoding: .utf8) ?? "No data")")

                // Set isConfirmationViewPresented to true after a successful request
                isConfirmationViewPresented = true
            }
        }.resume()
    }) {
        Text("Send Change Request")
            .font(.headline)
            .foregroundColor(.white)
            .padding(20)
            .background(Color.blue)
            .cornerRadius(100)
    }
    .sheet(isPresented: $isConfirmationViewPresented) {
        ConfirmationView()
    }
}
}

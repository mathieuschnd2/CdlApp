//
//  LogInView.swift
//  CDL
//
//  Created by mathieu schneider on 31.10.23.
//

import SwiftUI
import Firebase
import FirebaseAuth

struct LoginView: View {
    @State private var email = ""
    @State private var password = ""
    @State private var showAlert = false
    @State private var alertMessage = ""
    
    var body: some View {
        VStack {
            Text("Log In")
                .font(.largeTitle)
                .padding(.bottom, 30)

            TextField("Email", text: $email)
                .foregroundColor(.gray)
                .padding(15)
                .background(Color(.systemGray6))
                .cornerRadius(20)
                .frame(width: 300)
                .padding(.bottom, 20)

            SecureField("Password", text: $password)
                .foregroundColor(.gray)
                .padding(15)
                .background(Color(.systemGray6))
                .cornerRadius(20)
                .frame(width: 300)
                .padding(.bottom, 30)

            Button(action: {
                login()
            }) {
                Text("Log In")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding(20)
                    .background(Color.blue)
                    .cornerRadius(100)
            }
        }
        .alert(isPresented: $showAlert) {
            Alert(
                title: Text("Error"),
                message: Text(alertMessage),
                dismissButton: .default(Text("Done"))
            )
        }
    }

    func login() {
        Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
            if let error = error {
                let errorMessage = "Error logging in: \(error.localizedDescription)"
                print(errorMessage)

                // Show an alert to the user with the error message
                alertMessage = errorMessage
                showAlert = true
            } else {
                print("Logged in successfully")
                // The user has successfully logged in, and you can navigate to the next screen or perform other actions.
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}

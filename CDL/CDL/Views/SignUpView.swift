//
//  SignupView.swift
//  CDL
//
//  Created by mathieu schneider on 30.10.23.
//

import SwiftUI
import Firebase
import FirebaseAuth

struct SignupView: View {
    @State private var email = ""
    @State private var password = ""
    @State private var firstName = ""
    @State private var lastName = ""
    @State private var birthDate = ""
    @State private var grade = ""
    @State private var showAlert = false
    @State private var alertMessage = ""
    @State private var isLogInViewPresented = false

    var body: some View {
        VStack {
            
            Image("school_logo") // Replace "school_logo" with your school's image name
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 200)
                .padding(50)
            
            TextField("First Name", text: $firstName)
                .foregroundColor(.gray)
                .padding(15)
                .background(Color(.systemGray6))
                .cornerRadius(20)
                .frame(width: 400)
            
            TextField("Last Name", text: $lastName)
                .foregroundColor(.gray)
                .padding(15)
                .background(Color(.systemGray6))
                .cornerRadius(20)
                .frame(width: 400)
            
            TextField("Birth Date", text: $birthDate)
                .foregroundColor(.gray)
                .padding(15)
                .background(Color(.systemGray6))
                .cornerRadius(20)
                .frame(width: 400)
            
            TextField("Grade", text: $grade)
                .foregroundColor(.gray)
                .padding(15)
                .background(Color(.systemGray6))
                .cornerRadius(20)
                .frame(width: 400)
            
            TextField("Email", text: $email)
                .foregroundColor(.gray)
                .padding(15)
                .background(Color(.systemGray6))
                .cornerRadius(20)
                .frame(width: 400)
            
            SecureField("Password", text: $password)
                .foregroundColor(.gray)
                .padding(15)
                .background(Color(.systemGray6))
                .cornerRadius(20)
                .frame(width: 400)
            Spacer(minLength: 20)
            HStack{
                Button(action: {
                    createAccount()
                }) {
                    Image(systemName: "person.crop.circle.fill.badge.plus")
                        .font(.system(size: 20))
                        .foregroundColor(.white)
                        .symbolRenderingMode(.multicolor)
                    Text("Create Account")
                        .font(.headline)
                        .foregroundColor(.white)
                }
                .padding(20)
                .background(Color.blue)
                .cornerRadius(100)
                
                Button(action: {
                    isLogInViewPresented.toggle()
                }) {
                    Image(systemName: "person.crop.circle.fill.badge.checkmark")
                        .font(.system(size: 20))
                        .foregroundColor(.white)
                        .symbolRenderingMode(.multicolor)
                    Text("Log In")
                        .font(.headline)
                        .foregroundColor(.white)
                }
                .padding(20)
                .background(Color.yellow)
                .cornerRadius(100)
                .sheet(isPresented: $isLogInViewPresented) {
                    LoginView()
                }
            }
        }
        .alert(isPresented: $showAlert) {
            Alert(
                title: Text("Error"),
                message: Text(alertMessage),
                dismissButton: .default(Text("Done"))
            )
        }
        HStack {
                      Image("Nord_Anglia")
                          .resizable()
                          .aspectRatio(contentMode: .fit)
                          .frame(width: 100, height: 100)
                          .alignmentGuide(.leading) { d in d[.trailing] }
                          .padding(.bottom, 0)
                      Spacer()
                  }
    }

    func createAccount() {
        Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
            if let error = error {
                let errorMessage = "Error creating user: \(error.localizedDescription)"
                print(errorMessage)

                // Show an alert to the user with the error message
                alertMessage = errorMessage
                showAlert = true
            } else {
                print("User created successfully")
                // The user has been created, you can navigate to the next screen or perform any other necessary actions.
            }
        }
    }
}

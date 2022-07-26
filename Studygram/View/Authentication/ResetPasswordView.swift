//
//  ResetPasswordView.swift
//  Studygram
//
//  Created by Renzo Alvaroshan on 19/07/22.
//

import SwiftUI

struct ResetPasswordView: View {
    @EnvironmentObject var viewModel: AuthViewModel
    @Environment(\.presentationMode) var mode
    @Binding var email: String
    
    init(email: Binding<String>) {
        self._email = email
    }
    
    var body: some View {
        NavigationView {
            ZStack {
                LinearGradient(gradient: Gradient(colors: [.blue, .white]), startPoint: .top, endPoint: .bottom)
                    .ignoresSafeArea()
                
                VStack {
                    Image("Studygram")
                        .renderingMode(.template)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 220, height: 100)
                        .foregroundColor(.white)
                    
                    VStack(spacing: 20) {
                        // email field
                        CustomTextField(text: $email, placeholder: Text("Email"), imageName: "envelope")
                            .padding()
                            .background(Color(.init(white: 1, alpha: 0.15)))
                            .cornerRadius(10)
                            .foregroundColor(.white)
                            .padding(.horizontal, 32)
                            .textInputAutocapitalization(.never)
                            .keyboardType(.emailAddress)
                    }
                    
                    // forgot password
                    HStack {
                        Spacer()
                        
                        Button(action: {}) {
                            Text("Forgot Password")
                                .font(.system(size: 13, weight: .semibold))
                                .foregroundColor(.white)
                                .padding(.top)
                                .padding(.trailing, 32)
                        }
                    }
                    
                    // Log in button
                    Button {
                        viewModel.resetPassword(withEmail: email)
                    } label: {
                        Text("Send Reset Password Link")
                            .font(.headline)
                            .foregroundColor(.white)
                            .frame(width: 330, height: 50)
                            .background(.blue)
                            .clipShape(Capsule())
                            .padding()
                    }
                    
                    // go to sign up
                    Spacer()
                    
                    NavigationLink(
                        destination:
                            RegistrationView()
                            .navigationBarHidden(true)
                    ) {
                        HStack {
                            Text("Don't have an account?")
                                .font(.system(size: 14))
                            
                            Text("Sign Up")
                                .font(.system(size: 14, weight: .semibold))
                        }.foregroundColor(.blue)
                    }.padding(.bottom, 16)
                }
                .padding(.top, -44)
            }
        }
        .onReceive(viewModel.$didSendResetPasswordLink) { _ in
            self.mode.wrappedValue.dismiss()
        }
    }
}

//
//  RegistrationFormView.swift
//  mdt
//
//  Created by Derrick Hoon on 10/1/23.
//

import SwiftUI

struct RegistrationFormView: View {
    @Binding var registrationDetails: LoginDetails
    @Binding var confirmPassword: String
    @Binding var isError: Bool
    @Binding var isServerIssue: Bool
    @Binding var isNotMatch: Bool
    
    var body: some View {
        VStack {
            GeneralTextFieldView(label: "Username", labelColor: Theme.black.mainColor.opacity(0.8), textColor: Theme.darkBlue.mainColor, borderColor: Theme.black.mainColor.opacity(0.5), value: $registrationDetails.username)
            GeneralTextFieldView(label: "Password", labelColor: Theme.black.mainColor.opacity(0.8), textColor: Theme.darkBlue.mainColor, borderColor: Theme.black.mainColor.opacity(0.5), value: $registrationDetails.password)
            GeneralTextFieldView(label: "Confirm Password", labelColor: Theme.black.mainColor.opacity(0.8), textColor: Theme.darkBlue.mainColor, borderColor: Theme.black.mainColor.opacity(0.5), value: $confirmPassword)
            if (isError) {
                Text("Username already taken, please use another username. ")
                    .font(.caption)
                    .foregroundColor(Theme.failureRed.mainColor)
                    .padding(.horizontal, 20)
            }
            if (isServerIssue) {
                Text("Successfully registered but unable to login, please try again later. ")
                    .font(.caption)
                    .foregroundColor(Theme.failureRed.mainColor)
                    .padding(.horizontal, 20)
            }
            if (isNotMatch) {
                Text("Passwords do not match. ")
                    .font(.caption)
                    .foregroundColor(Theme.failureRed.mainColor)
                    .padding(.horizontal, 20)
            }
        }
        .padding(.horizontal, 10)
        .padding(.bottom, 10)
    }
}

struct RegistrationFormView_Previews: PreviewProvider {
    static let registrationDetails = LoginDetails()
    static let confirmPassword = ""
    static let isError = true
    static let isServerIssue = true
    static let isNotMatch = true
    
    static var previews: some View {
        RegistrationFormView(registrationDetails: .constant(registrationDetails), confirmPassword: .constant(confirmPassword), isError: .constant(isError), isServerIssue: .constant(isServerIssue), isNotMatch: .constant(isNotMatch))
    }
}

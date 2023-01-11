//
//  LoginFormView.swift
//  mdt
//
//  Created by Derrick Hoon on 9/1/23.
//

import SwiftUI

struct LoginFormView: View {
    @Binding var loginDetails: LoginDetails
    @Binding var isError: Bool
    
    var body: some View {
        VStack(alignment: .leading) {
            GeneralTextFieldView(label: "Username", labelColor: Theme.black.mainColor.opacity(0.8), textColor: Theme.darkBlue.mainColor, borderColor: Theme.black.mainColor.opacity(0.5), value: $loginDetails.username)
            GeneralTextFieldView(label: "Password", labelColor: Theme.black.mainColor.opacity(0.8), textColor: Theme.darkBlue.mainColor, borderColor: Theme.black.mainColor.opacity(0.5), value: $loginDetails.password)
            if (isError) {
                Text("Incorrect credentials. ")
                    .font(.caption)
                    .foregroundColor(Theme.failureRed.mainColor)
                    .padding(.horizontal, 20)
            }
        }
        .padding(.horizontal, 10)
        .padding(.bottom, 10)
    }
}

struct LoginFormView_Previews: PreviewProvider {
    static let loginDetails = LoginDetails()
    static let isError = true
    
    static var previews: some View {
        LoginFormView(loginDetails: .constant(loginDetails), isError: .constant(isError))
    }
}

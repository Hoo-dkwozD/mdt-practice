//
//  RegistrationView.swift
//  mdt
//
//  Created by Derrick Hoon on 9/1/23.
//

import SwiftUI

struct RegistrationView: View {
    @State var registrationDetails = LoginDetails()
    @State var confirmPassword = ""
    @State var targetIndex = CarouselIndex()
    @State var isGotoHome = false
    @State var isError = false
    @State var isServerIssue = false
    @State var isNotMatch = false
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @EnvironmentObject var globalStates: GlobalStates
    
    var isDisabledBtn: Bool {
        !registrationDetails.isFilled()
    }
    
    func registerAndLoginOnClick() -> Void {
        guard !isDisabledBtn else { return }
        
        isError = false
        guard (confirmPassword == registrationDetails.password) else { isNotMatch = true; return; }
        isNotMatch = false

        MdtAPIService.shared.createRegistration(registrationDetails: registrationDetails, completion: { response in
            if (response.isSuccessful()) {
                let loginDetails = LoginDetails(username: registrationDetails.username, password: registrationDetails.password)
                MdtAPIService.shared.createLogin(loginDetails: loginDetails, completion: { response in
                    if (response.isSuccessful()) {
                        DispatchQueue.main.async {
                            globalStates.update(APIToken: response.token!, accountNo: response.accountNo!, username: response.username!)
                        }
                        isGotoHome = true
                    } else {
                        isServerIssue = true
                    }
                })
            } else {
                isError = true
            }
        })
    }
    
    var body: some View {
        ZStack {
            VStack(alignment: .leading) {
                NavigationLink(destination: HomeView(), isActive: $isGotoHome) {
                    EmptyView()
                }
                TopBarLeadingView(buttonAction: { self.presentationMode.wrappedValue.dismiss() }, buttonIconName: "BackArrow", barText: "")
                    .padding(.bottom, 20)
                Text("Registration")
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(.top, 30)
                    .padding(.bottom, 20)
                    .padding(.horizontal, 30)
                RegistrationFormView(registrationDetails: $registrationDetails, confirmPassword: $confirmPassword, isError: $isError, isServerIssue: $isServerIssue, isNotMatch: $isNotMatch)
                Spacer()
                BottomButtonView(targetIndex: $targetIndex, buttonColor: Theme.darkBlue, isDisabled: isDisabledBtn, bottomButtonText: "Login", bottomButtonAction: registerAndLoginOnClick)
            }
            .frame(maxWidth: .infinity)
            .padding(.horizontal, 40)
        }
        .navigationBarTitle("")
        .navigationBarHidden(true)
        .background(Theme.base.mainColor)
    }
}

struct RegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            RegistrationView()
        }
    }
}

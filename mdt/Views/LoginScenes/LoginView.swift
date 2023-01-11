//
//  LoginView.swift
//  mdt
//
//  Created by Derrick Hoon on 9/1/23.
//

import SwiftUI

struct LoginView: View {
    @State var loginDetails = LoginDetails()
    @State var targetIndex = CarouselIndex()
    @State var isGotoHome = false
    @State var isError = false
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @EnvironmentObject var globalStates: GlobalStates
    
    var isDisabledBtn: Bool {
        !loginDetails.isFilled()
    }
    
    func loginOnClick() -> Void {
        guard !isDisabledBtn else { return }
        
        isError = false

        MdtAPIService.shared.createLogin(loginDetails: loginDetails, completion: { response in
            if (response.isSuccessful()) {
                DispatchQueue.main.async {
                    globalStates.update(APIToken: response.token!, accountNo: response.accountNo!, username: response.username!)
                }
                isGotoHome = true
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
                Text("Login")
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(.top, 30)
                    .padding(.bottom, 20)
                    .padding(.horizontal, 30)
                LoginFormView(loginDetails: $loginDetails, isError: $isError)
                Spacer()
                BottomButtonView(targetIndex: $targetIndex, buttonColor: Theme.darkBlue, isDisabled: isDisabledBtn, bottomButtonText: "Login", bottomButtonAction: loginOnClick)
            }
            .frame(maxWidth: .infinity)
            .padding(.horizontal, 40)
        }
        .navigationBarTitle("")
        .navigationBarHidden(true)
        .background(Theme.base.mainColor)
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            LoginView()
        }
    }
}

//
//  PayeesSearchView.swift
//  mdt
//
//  Created by Derrick Hoon on 16/1/23.
//

import SwiftUI

struct PayeesSearchView: View {
    @State var search = ""
    @State var payees: [Payee] = []
    
    @Binding var payee: Payee?
    
    let btnAction: () -> Void
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @EnvironmentObject var globalStates: GlobalStates
    
    func selectPayee(payee: Payee) -> Void {
        self.payee = payee
    }
    
    func loadPayees() {
        guard globalStates.APIToken != nil else { return self.presentationMode.wrappedValue.dismiss() }
        
        MdtAPIService.shared.readPayees(token: globalStates.APIToken!) { response in
            if (response.isSuccessful()) {
                DispatchQueue.main.async {
                    payees = response.data!
                }
            } else {
                self.presentationMode.wrappedValue.dismiss()
            }
        }
    }
    
    var body: some View {
        VStack {
            VStack {
                Button(action: btnAction) {
                    Image("DownArrow")
                        .foregroundColor(Theme.black.mainColor)
                        .frame(width: 30, height: 30)
                }
                .padding(.top, 5)
                HStack {
                    TextField("", text: $search)
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(
                            Theme.black.mainColor.opacity(0.3)
                        )
                }
                .padding()
                .foregroundColor(Theme.black.mainColor)
                .background(
                    Theme.black.mainColor.opacity(0.1)
                )
                .cornerRadius(10)
                VStack {
                    ForEach(payees, id: \.id) { payee in
                        HStack {
                            VStack(alignment: .leading) {
                                Text(payee.name)
                                    .fontWeight(.bold)
                                Text(payee.accountNo)
                            }
                            Spacer()
                            Image("RightArrow")
                                .foregroundColor(Theme.black.mainColor)
                                .frame(width: 25, height: 25)
                        }
                        .onTouchDownUp { pressed in
                            if (pressed) {
                                selectPayee(payee: payee)
                                btnAction()
                            }
                        }
                    }
                }
                .padding(.vertical, 10)
            }
            Spacer()
        }
        .onAppear {
            loadPayees()
        }
    }
}

struct PayeesSearchView_Previews: PreviewProvider {
    static var previews: some View {
        PayeesSearchView(payee: .constant(nil), btnAction: {})
    }
}

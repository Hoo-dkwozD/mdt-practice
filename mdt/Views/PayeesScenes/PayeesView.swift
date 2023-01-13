//
//  PayeesView.swift
//  mdt
//
//  Created by Derrick Hoon on 13/1/23.
//

import SwiftUI

struct PayeesView: View {
    @State var payees: [Payee] = []
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @EnvironmentObject var globalStates: GlobalStates
    
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
        GeneralBackgroundView {
            VStack {
                TopBarLeadingView(
                    buttonAction: { self.presentationMode.wrappedValue.dismiss() },
                    buttonIconName: "BackArrow",
                    barText: "Payees"
                )
                ScrollView {
                    VStack {
                        ForEach(payees, id: \.id) { payee in
                            CardView(backgroundColors: [Theme.white.mainColor], textColor: Theme.white.accentColor) {
                                VStack(alignment: .leading) {
                                    VStack(alignment: .leading) {
                                        HStack {
                                            Text("Name:")
                                                .font(.caption)
                                                .foregroundColor(Theme.gray.mainColor.opacity(0.70))
                                            Spacer()
                                        }
                                        HStack {
                                            Text(payee.name)
                                            Spacer()
                                        }
                                    }
                                    VStack(alignment: .leading) {
                                        HStack {
                                            Text("Account No.:")
                                                .font(.caption)
                                                .foregroundColor(Theme.gray.mainColor.opacity(0.70))
                                            Spacer()
                                        }
                                        HStack {
                                            Text(payee.accountNo)
                                            Spacer()
                                        }
                                    }
                                }
                            }
                            .padding(.horizontal, 10)
                            .padding(.bottom, 10)
                        }
                    }
                }
            }
        }
        .onAppear(perform: loadPayees)
    }
}

struct PayeesView_Previews: PreviewProvider {
    static var previews: some View {
        PayeesView()
    }
}

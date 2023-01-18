//
//  TransactionsView.swift
//  mdt
//
//  Created by Derrick Hoon on 13/1/23.
//

import SwiftUI

struct TransactionsView: View {
    @Binding var transactionDetails: [TransactionDetail]
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @EnvironmentObject var globalStates: GlobalStates
    
    var body: some View {
        GeneralBackgroundView { isLoading in 
            VStack {
                TopBarLeadingView(buttonAction: { self.presentationMode.wrappedValue.dismiss() }, buttonIconName: "BackArrow", barText: "Transaction History")
                ScrollView {
                    VStack(alignment: .leading) {
                        ForEach(transactionDetails, id: \.transactionId) { transactionDetail in
                            CardView(backgroundColors: [Theme.white.mainColor], textColor: Theme.white.accentColor) {
                                VStack(alignment: .leading) {
                                    HStack {
                                        Spacer()
                                        HStack {
                                            Text("SGD ")
                                                .font(.title)
                                                .fontWeight(.bold)
                                            Text(String(format: transactionDetail.amount < 0 ? "%.2f" : "+%.2f", transactionDetail.amount))
                                                .font(.title)
                                                .fontWeight(.bold)
                                                .foregroundColor(transactionDetail.amount < 0 ? Theme.failureRed.mainColor : Theme.successGreen.mainColor)
                                        }
                                    }
                                    HStack {
                                        Text(transactionDetail.username)
                                            .fontWeight(.bold)
                                        Spacer()
                                    }
                                    HStack {
                                        Text(transactionDetail.accountNo)
                                            .fontWeight(.bold)
                                        Spacer()
                                    }
                                    HStack {
                                        Text("Time:")
                                            .font(.caption)
                                            .foregroundColor(Theme.gray.mainColor.opacity(0.7))
                                        Spacer()
                                    }
                                    HStack {
                                        Text(transactionDetail.transactionDate.getDatetimeDescription())
                                        Spacer()
                                    }
                                    HStack {
                                        Text("Description:")
                                            .font(.caption)
                                            .foregroundColor(Theme.gray.mainColor.opacity(0.7))
                                        Spacer()
                                    }
                                    HStack {
                                        Text(transactionDetail.description)
                                        Spacer()
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
    }
}

struct TransactionsView_Previews: PreviewProvider {
    static var previews: some View {
        TransactionsView(transactionDetails: .constant([]))
    }
}

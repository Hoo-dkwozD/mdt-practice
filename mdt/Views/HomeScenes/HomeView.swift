//
//  HomeView.swift
//  mdt
//
//  Created by Derrick Hoon on 10/1/23.
//

import SwiftUI

struct HomeView: View {
    @State var balance: Double = 0.0
    @State var transactionHistory: [TransactionCardDetail] = []
    @State var isLoadedTransactionHistory = false
    @State var isPayeesScene = false
    @State var isTransferScene = false
    
    let transactionBackgroundColor = Theme.white.mainColor
    let transactionTextColor = Theme.black.mainColor.opacity(0.8)
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @EnvironmentObject var globalStates: GlobalStates
    
    func fillBalance() -> Void {
        guard globalStates.APIToken != nil else { return self.presentationMode.wrappedValue.dismiss() }
        
        MdtAPIService.shared.readBalance(token: globalStates.APIToken!) { response in
            if (response.isSuccessful()) {
                DispatchQueue.main.async {
                    balance = response.balance!
                }
            } else {
                self.presentationMode.wrappedValue.dismiss()
            }
        }
    }
    
    func populateTransactionHistory() -> Void {
        guard globalStates.APIToken != nil else { return self.presentationMode.wrappedValue.dismiss() }
        
        MdtAPIService.shared.readTransactions(token: globalStates.APIToken!) { response in
            if (response.isSuccessful()) {
                DispatchQueue.main.async {
                    let transactions = response.data!
                    var transactionsGroupedByDay: Dictionary<Date, [TransactionDetail]> = [:]
                    var newTransactionHistory: [TransactionCardDetail] = []
                    
                    for transaction in transactions {
                        let date = TransactionCardDetail
                            .getDateFromString(dateString: transaction.transactionDate, dateFormat: "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'")
                        let key = date?.getDateOnly()
                        
                        if (key == nil) {
                            continue
                        }
                        
                        if (transactionsGroupedByDay[key!] == nil) {
                            if (transaction.receipient != nil) {
                                transactionsGroupedByDay[key!] = [
                                    TransactionDetail(
                                        transactionId: transaction.transactionId, username: transaction.receipient!.accountHolder, accountNo: transaction.receipient!.accountNo, amount: -(transaction.amount), transactionDate: date ?? Date(), description: transaction.description, transactionType: transaction.transactionType
                                    )
                                ]
                            } else {
                                transactionsGroupedByDay[key!] = [
                                    TransactionDetail(
                                        transactionId: transaction.transactionId, username: transaction.sender!.accountHolder, accountNo: transaction.sender!.accountNo, amount: transaction.amount, transactionDate: date ?? Date(), description: transaction.description, transactionType: transaction.transactionType
                                    )
                                ]
                            }
                        } else {
                            if (transaction.receipient != nil) {
                                transactionsGroupedByDay[key!]!.append(
                                    TransactionDetail(transactionId: transaction.transactionId, username: transaction.receipient!.accountHolder, accountNo: transaction.receipient!.accountNo, amount: -(transaction.amount), transactionDate: date ?? Date(), description: transaction.description, transactionType: transaction.transactionType)
                                )
                            } else {
                                transactionsGroupedByDay[key!]!.append(
                                    TransactionDetail(transactionId: transaction.transactionId, username: transaction.sender!.accountHolder, accountNo: transaction.sender!.accountNo, amount: transaction.amount, transactionDate: date ?? Date(), description: transaction.description, transactionType: transaction.transactionType)
                                )
                            }
                        }
                    }
                    
                    for key in transactionsGroupedByDay.keys {
                        var groupedTransactions = transactionsGroupedByDay[key]!
                        groupedTransactions.sort {
                            $0.transactionDate > $1.transactionDate
                        }
                        
                        newTransactionHistory.append(
                            TransactionCardDetail(date: key, transactionDetails: groupedTransactions)
                        )
                    }
                    
                    newTransactionHistory.sort {
                        $0.date > $1.date
                    }
                    
                    transactionHistory = newTransactionHistory
                    isLoadedTransactionHistory = true
                }
            } else {
                self.presentationMode.wrappedValue.dismiss()
            }
        }
    }
    
    func goToPayeesScene() -> Void {
        self.isPayeesScene = true
    }
    
    func goToTransferScene() -> Void {
        self.isTransferScene = true
    }
    
    var body: some View {
        ZStack {
            VStack {
                ScrollView {
                    VStack(alignment: .leading) {
                        TopBarTrailingView(buttonAction: { self.presentationMode.wrappedValue.dismiss() }, buttonIconName: "Logout", barText: "MDT E-Wallet")
                            .padding(.bottom, 20)
                        HomeMainCardView(bottomColor: Theme.lightBlue, topColor: Theme.blue, username: globalStates.username ?? "", accountNo: globalStates.accountNo ?? "", balance: $balance)
                            .padding(.bottom, 20)
                        Text("Transaction History")
                            .font(.title)
                            .fontWeight(.bold)
                        HStack {
                            Spacer()
                            Button(action: {}) {
                                Text("See All")
                                    .underline()
                                    .foregroundColor(Theme.black.mainColor)
                            }
                        }
                        .padding(.bottom, 5)
                        if (isLoadedTransactionHistory) {
                            HomeTransactionCardsView(backgroundColor: transactionBackgroundColor, textColor: transactionTextColor, transactionCardDetails: $transactionHistory)
                                .padding(.bottom, 30)
                        } else {
                            Spacer()
                        }
                    }
                    .frame(maxWidth: .infinity)
                    .padding(.horizontal, 50)
                }
                NavigationLink(destination: Text("payees"), isActive: $isPayeesScene) {
                    EmptyView()
                }
                NavigationLink(destination: Text("transfer"), isActive: $isTransferScene) {
                    EmptyView()
                }
                NavBarView(
                    navBarButtonDetails: [
                        NavBarButtonDetail(btnAction: goToPayeesScene, btnIcon: "Payees", btnColor: [Theme.base]),
                        NavBarButtonDetail(btnAction: goToTransferScene, btnIcon: "Transfer", btnColor: [Theme.lightBlue, Theme.blue])
                    ]
                )
            }
        }
        .navigationBarTitle("")
        .navigationBarHidden(true)
        .background(Theme.base.mainColor)
        .onAppear {
            fillBalance()
            populateTransactionHistory()
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            HomeView(balance: 10.0)
        }
    }
}

//
//  FullTransactionsView.swift
//  mdt
//
//  Created by Derrick Hoon on 13/1/23.
//

import SwiftUI

struct FullTransactionsView: View {
    @State var groupedTransactionHistory: [TransactionCardDetail]
    @State var transactionDetails: [TransactionDetail] = []
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @EnvironmentObject var globalStates: GlobalStates
    
    func formatTransactionHistory(groupedHistory: [TransactionCardDetail]) -> [TransactionDetail] {
        var result: [TransactionDetail] = []
        
        for cardDetail in groupedHistory {
            for detail in cardDetail.transactionDetails {
                result.append(detail)
            }
        }
        
        return result
    }
    
    var body: some View {
        TransactionsView(transactionDetails: $transactionDetails)
            .onAppear {
                transactionDetails = formatTransactionHistory(groupedHistory: groupedTransactionHistory)
            }
    }
}

struct FullTransactionsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            FullTransactionsView(groupedTransactionHistory: [])
        }
    }
}

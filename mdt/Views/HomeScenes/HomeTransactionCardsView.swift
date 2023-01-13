//
//  HomeTransactionCardsView.swift
//  mdt
//
//  Created by Derrick Hoon on 12/1/23.
//

import SwiftUI

struct HomeTransactionCardsView: View {
    var backgroundColor: Color
    var textColor: Color
    @Binding var transactionCardDetails: [TransactionCardDetail]
    
    var body: some View {
        VStack {
            ForEach($transactionCardDetails, id: \.date) { transactionCardDetail in
                HomeTransactionCardView(backgroundColor: backgroundColor, textColor: textColor, transactionCardDetail: transactionCardDetail)
                    .padding(.bottom, 10)
            }
        }
    }
}

struct HomeTransactionCardsView_Previews: PreviewProvider {
    static var previews: some View {
        HomeTransactionCardsView(backgroundColor: Theme.white.mainColor, textColor: Theme.black.mainColor.opacity(0.8), transactionCardDetails: .constant(TransactionCardDetail.sampleData))
    }
}

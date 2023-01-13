//
//  HomeTransactionCardView.swift
//  mdt
//
//  Created by Derrick Hoon on 12/1/23.
//

import SwiftUI

struct HomeTransactionCardView: View {
    let backgroundColor: Color
    let textColor: Color
    @Binding var transactionCardDetail: TransactionCardDetail
    
    var body: some View {
        CardView(backgroundColors: [backgroundColor], textColor: textColor) {
            VStack {
                HStack {
                    Spacer()
                    Text(transactionCardDetail.date.getDateDescription())
                        .fontWeight(.bold)
                }
                .padding(.bottom, 5)
                ForEach(transactionCardDetail.transactionDetails, id: \.transactionId) { transactionDetail in
                    HStack {
                        VStack(alignment: .leading) {
                            Text(transactionDetail.username)
                                .fontWeight(.bold)
                            Text(transactionDetail.accountNo)
                                .font(.caption)
                        }
                        Spacer()
                        HStack {
                            Text("SGD ")
                                .fontWeight(.bold)
                            Text(String(format: transactionDetail.amount < 0 ? "%.2f" : "+%.2f", transactionDetail.amount))
                                .fontWeight(.bold)
                                .foregroundColor(transactionDetail.amount < 0 ? Theme.failureRed.mainColor : Theme.successGreen.mainColor)
                        }
                    }
                    .padding(.bottom, 5)
                }
            }
        }
    }
}

struct HomeTransactionCardView_Previews: PreviewProvider {
    static var previews: some View {
        HomeTransactionCardView(backgroundColor: Theme.lightBlue.mainColor, textColor: Theme.black.mainColor.opacity(0.8), transactionCardDetail: .constant(TransactionCardDetail.sampleData[0]))
    }
}

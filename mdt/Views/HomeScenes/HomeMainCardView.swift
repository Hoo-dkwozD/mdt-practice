//
//  HomeCardView.swift
//  mdt
//
//  Created by Derrick Hoon on 11/1/23.
//

import SwiftUI

struct HomeMainCardView: View {
    let bottomColor: Theme
    let topColor: Theme
    let username: String
    let accountNo: String
    
    @Binding var balance: Double
    
    var body: some View {
        CardView(backgroundColors: [bottomColor.mainColor, topColor.mainColor], textColor: topColor.accentColor) {
            VStack {
                VStack(alignment: .trailing) {
                    HStack {
                        Spacer()
                        Text("Balance")
                    }
                    HStack {
                        Spacer()
                        Text(String(format: "SGD %.2f", balance))
                            .font(.title)
                            .fontWeight(.bold)
                    }
                }
                .padding(.bottom, 10)
                VStack(alignment: .leading) {
                    HStack {
                        Text("Account No.")
                        Spacer()
                    }
                    HStack {
                        Text(accountNo)
                            .font(.title)
                            .fontWeight(.bold)
                        Spacer()
                    }
                    HStack {
                        Text("Account Holder")
                        Spacer()
                    }
                    HStack {
                        Text(username)
                            .font(.title)
                            .fontWeight(.bold)
                        Spacer()
                    }
                }
            }
        }
    }
}

struct HomeCardView_Previews: PreviewProvider {
    static var previews: some View {
        HomeMainCardView(bottomColor: Theme.lightBlue, topColor: Theme.blue, username: "Test", accountNo: "123", balance: .constant(1000.0))
    }
}

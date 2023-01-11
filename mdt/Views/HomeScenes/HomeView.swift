//
//  HomeView.swift
//  mdt
//
//  Created by Derrick Hoon on 10/1/23.
//

import SwiftUI

struct HomeView: View {
    @State var balance: Double = 0.0
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @EnvironmentObject var globalStates: GlobalStates
    
    var body: some View {
        ZStack {
            VStack(alignment: .leading) {
                TopBarTrailingView(buttonAction: { self.presentationMode.wrappedValue.dismiss() }, buttonIconName: "Logout", barText: "MDT E-Wallet")
                    .padding(.bottom, 20)
                HomeCardView(bottomColor: Theme.lightBlue, topColor: Theme.blue, username: globalStates.username ?? "", accountNo: globalStates.accountNo ?? "", balance: $balance)
                Spacer()
            }
            .frame(maxWidth: .infinity)
            .padding(.horizontal, 40)
        }
        .navigationBarTitle("")
        .navigationBarHidden(true)
        .background(Theme.base.mainColor)
        .onAppear {
            
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
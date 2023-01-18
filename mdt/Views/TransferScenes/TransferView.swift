//
//  TransferView.swift
//  mdt
//
//  Created by Derrick Hoon on 13/1/23.
//

import SwiftUI

struct TransferView: View {
    @State var isAddPayeeView = false
    @State var isPresentAmountInput = false
    @State var isPresentDesc = true
    @State var payee: Payee? = nil
    @State var balance: Double = 0.0
    @State var amtAsString: String = ""
    @State var description: String = "testing"
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @EnvironmentObject var globalStates: GlobalStates
    
    var amtAsDouble: Double {
        return Double(amtAsString) ?? 0.0
    }
    
    var isPresentBottomBtn: Bool {
        return (isAddPayeeView && isPresentAmountInput && isPresentDesc)
    }
    
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
    
    var body: some View {
        GeneralBackgroundView { isLoading in
            VStack(alignment: .leading) {
                TopBarLeadingView(buttonAction: { self.presentationMode.wrappedValue.dismiss() }, buttonIconName: "BackArrow", barText: "Transfer")
                Text("Recipient")
                    .fontWeight(.bold)
                RecipientCardView(topText: payee != nil ? payee!.name : "Name", bottomText: payee != nil ? payee!.accountNo : "Account No.", backgroundColors: [Theme.cyan.mainColor, Theme.darkCyan.mainColor], textColor: Theme.white.mainColor, isFilled: payee != nil)
                    .onTouchDownUp { pressed in
                        self.isAddPayeeView = pressed
                    }
                    .padding(.bottom, 10)
                if (isPresentAmountInput) {
                    AmountInputView(balance: $balance, amtAsString: $amtAsString, isPresentDesc: $isPresentDesc, inputDefaultText: "   ")
                }
                if (isPresentDesc) {
//                    TransferDescriptionView(description: $description, colors: [Theme.cyan.mainColor, Theme.darkCyan.mainColor])
                }
                Spacer()
                if (isPresentBottomBtn) {
//                    BottomButtonView(targetIndex: $targetIndex, buttonColor: Theme.darkBlue, isDisabled: isDisabledBtn, bottomButtonText: "Login", bottomButtonAction: { loginOnClick(isLoading: isLoading) })
                }
            }
        }
        .sheet(isPresented: $isAddPayeeView) {
            PayeesSearchView(payee: $payee, btnAction: { isAddPayeeView = false; isPresentAmountInput = (payee != nil); })
                .padding(.horizontal, 20)
        }
        .onAppear {
            fillBalance()
        }
    }
}

extension View {
    /// Include method that enables custom touch event.
    func onTouchDownUp(_ pressed: @escaping (Bool) -> Void) -> some View {
        self.modifier(
            TouchDownUpEventModifier(pressed: pressed)
        )
    }
}

struct TouchDownUpEventModifier: ViewModifier {
    /// Keep track of current dragging state.
    @State var dragged = false
    
    /// Callback when touch event completes. State of gesture passed in.
    var pressed: (Bool) -> Void
    
    func body(content: Content) -> some View {
        content
            .gesture(
                DragGesture(minimumDistance: 0.0)
                    .onChanged { _ in
                        if (!dragged) {
                            dragged = true
                            pressed(true) // Touch
                        }
                    }
                    .onEnded { _ in
                        dragged = false
                        pressed(false) // End touch
                    }
            )
    }
}

struct GlobalGeometryGetter: View {
    @Binding var rect: CGRect

    var body: some View {
        return GeometryReader { geometry in
            self.makeView(geometry: geometry)
        }
    }

    func makeView(geometry: GeometryProxy) -> some View {
        DispatchQueue.main.async {
            self.rect = geometry.frame(in: .global)
        }

        return Rectangle().fill(Color.clear)
    }
}

struct TransferView_Previews: PreviewProvider {
    static var previews: some View {
        TransferView()
    }
}

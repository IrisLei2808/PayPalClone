//
//  MoneyView.swift
//  ClonePaypalScreen
//
//  Created by Duc Le on 7/17/23.
//

import SwiftUI

struct MoneyView: View {
    var page: Money
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Image("\(page.imageUrl)")
                .resizable()
                .padding()
                .cornerRadius(30)
                .background(.cyan)
                .cornerRadius(10)
                .frame(width: 300, height: 400)
                .padding()
                .overlay {
                    VStack(spacing: 20) {
                        Image(page.btnUrl)
                            .resizable()
                            .scaledToFit()
                        Text(page.name)
                            .font(.title)
                        Text(page.description)
                            .font(.subheadline)
                            .frame(width: 300)
                        Button(page.btnTittle) {
                            print("Button tapped!")
                        }
                        .tint(.white)
                        .buttonStyle(.bordered)
                        .cornerRadius(10)
                    }
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                    .padding(.bottom, 40)
                }
                .padding(.trailing, 60)
        }
        .padding(.bottom, 40)
    }
}

struct MoneyView_Previews: PreviewProvider {
    static var previews: some View {
        MoneyView(page: Money.samplePage)
    }
}

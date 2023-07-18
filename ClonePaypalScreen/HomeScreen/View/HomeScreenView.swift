//
//  HomeScreenView.swift
//  ClonePaypalScreen
//
//  Created by Duc Le on 7/17/23.
//

import SwiftUI

struct HomeScreenView: View {
    
    @State private var pageIndex = 0
    private let pages: [Money] = Money.samplePages
    @State private var images: [String] = [
        "impact2",
        "impact1",
        "iimpact"
    ]
    @State private var imagesCrypto: [String] = [
        "crypto",
        "crypto1",
        "crypto2"
    ]
    @State private var selectedTab = 0
    
    init() {
        UIPageControl.appearance().isHidden = true
    }
    
    var body: some View {
        
        TabView(selection: $selectedTab) {
            ScrollView {
                VStack(alignment: .leading) {
                    headerMenu
                        .foregroundColor(.blue)
                    
                    Text("Get started with Paypal")
                        .padding(.top, 40)
                        .foregroundColor(.gray)
                    
                    TabView(selection: $pageIndex) {
                        ForEach(pages, id: \.self) { page in
                            VStack {
                                MoneyView(page: page)
                            }
                        }
                    }
                    .animation(.easeInOut, value: pageIndex)
                    .indexViewStyle(.page(backgroundDisplayMode: .interactive))
                    .tabViewStyle(PageTabViewStyle())
                    .frame(height: 400) //
                    
                    stepProgress
                    
                    Text("Make an impact")
                        .foregroundColor(.black)
                        .font(.title3)
                        .padding(.top, 20)
                        .padding(.horizontal)
                    SlidingImageView(images: $images)
                    HStack {
                        Spacer()
                        Button("More deals") {
                            print("Button tapped!")
                        }
                        .font(.title2)
                        .bold()
                        Spacer()
                    }
                    .padding(.top, 10)
                    
                    Text("Invest on cryptocurrency?")
                        .foregroundColor(.black)
                        .font(.title3)
                        .padding(.top, 15)
                        .padding(.horizontal)
                    SlidingImageView(images: $imagesCrypto)
                    HStack {
                        Spacer()
                        Button("Buy crypto") {
                            print("Button tapped!")
                        }
                        .font(.title2)
                        .bold()
                        Spacer()
                    }
                    .padding(.top, 10)
                }
                .padding(.horizontal)
            }
            .tabItem {
                Label("Home", systemImage: "house")
            }
            .tag(0)
            
            Text("Finances")
                .tabItem {
                    Label("Finances", systemImage: "chart.bar")
                }
                .tag(1)
            Text("Payments")
                .tabItem {
                    Label("Payments", systemImage: "dollarsign")
                }
                .tag(2)
            Text("Deals")
                .tabItem {
                    Label("Deals", systemImage: "tag")
                }
                .tag(3)
            Text("Wallet")
                .tabItem {
                    Label("Wallet", systemImage: "wallet.pass")
                }
                .tag(4)
        }
    }
}

struct HomeScreenView_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreenView()
    }
}

extension HomeScreenView {
    private var headerMenu: some View {
        HStack(spacing: 10) {
            Image(systemName: "line.3.horizontal")
            Spacer()
            Image("Color-Paypal-Logo")
                .resizable()
                .scaledToFit()
                .frame(width: 50, height: 50)
                .padding(.leading, 60)
            Spacer()
            Image(systemName: "square.and.pencil")
            Image(systemName: "qrcode.viewfinder")
            Image("channels4_profile")
                .resizable()
                .frame(width: 30, height: 30)
        }
    }
    
    private var stepProgress: some View {
        HStack(spacing: 10) {
            Circle()
                .trim(from: 0, to: 0.75)
                .stroke(Color.pink.opacity(0.5), lineWidth: 3)
                .frame(width: 40, height: 40)
                .cornerRadius(20)
            
            VStack(alignment: .leading, spacing: 4) {
                Text("Set up your account")
                    .font(.title2)
                    .fontWeight(.bold)
                
                Text("A few more steps left.")
                    .foregroundColor(.gray)
            }
            
            Spacer()
        }
        .padding(.horizontal, 10)
        .frame(maxWidth: .infinity, maxHeight: 50)
        .background(
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color.gray.opacity(0.3), lineWidth: 1)
        )
    }
    
}

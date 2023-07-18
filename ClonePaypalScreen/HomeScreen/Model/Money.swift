//
//  Money.swift
//  ClonePaypalScreen
//
//  Created by Duc Le on 7/17/23.
//

import Foundation

struct Money: Identifiable, Equatable, Hashable {
    let id = UUID()
    var name: String
    var description: String
    var imageUrl: String
    var tag: Int
    var btnTittle: String
    var btnUrl: String
    
    static var samplePage = Money(name: "Title Example", description: "This is a sample description for the purpose of debugging", imageUrl: "work", tag: 0, btnTittle: "Button", btnUrl: "Image")
    
    static var samplePages: [Money] = [
        Money(name: "Send money", description: "Pay someone, buy something or a gift", imageUrl: "cowork", tag: 0, btnTittle: "Explore Crypto", btnUrl: "paypal"),
        Money(name: "Request money", description: "Ask a friend to pay you back", imageUrl: "work", tag: 1, btnTittle: "Send Now", btnUrl: "paypal1"),
        Money(name: "Send money aboard", description: "Send directly to bank account and cash", imageUrl: "website", tag: 2, btnTittle: "Send a Request", btnUrl: "paypal2"),
        Money(name: "Buy and hold crypto", description: "Learn more about crypto before diving in", imageUrl: "website", tag: 2, btnTittle: "Shop and Save", btnUrl: "paypal3"),
    ]
}

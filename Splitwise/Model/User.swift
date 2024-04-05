//
//  User.swift
//  Splitwise
//
//  Created by Akash Tiwari on 05/04/24.
//

import Foundation

struct User {
    let id: Int
    let name: String
    var accountBalance: CGFloat = 0
    var transaction: [Transactions] = []
}

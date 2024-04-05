//
//  Transactions.swift
//  Splitwise
//
//  Created by Akash Tiwari on 05/04/24.
//

import Foundation

enum TransactionsType {
    case taken
    case given
}

struct Transactions {
    let type: TransactionsType
    let amount: CGFloat
    let user: User
}

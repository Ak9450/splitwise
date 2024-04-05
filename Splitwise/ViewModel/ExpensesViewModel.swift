//
//  ExpensesViewModel.swift
//  Splitwise
//
//  Created by Akash Tiwari on 05/04/24.
//

import Foundation

protocol ViewBalanceViewModel {
    func getUsers() -> [User]
}

protocol AddExpanseViewModel {
    func addExpanse(paidByName: String, amount: CGFloat)
    func addParticipant(name: String)
}

class ExpensesViewModel: ViewBalanceViewModel, AddExpanseViewModel {
    private var users: [User] = []
    private var participants: [User] = []
    
    internal func addParticipant(name: String) {
        if let existingUser = users.first(where: { $0.name == name }) {
            participants.append(existingUser)
        } else {
            let userId = users.count + 1
            let newUser = User(id: userId, name: name)
            
            users.append(newUser)
            participants.append(newUser)
        }
    }
    
    internal func addExpanse(paidByName: String, amount: CGFloat) {
        
        // Check if paidBy user already exists, otheriwse create a new one.
        var paidBy = users.first(where: { $0.name == paidByName }) ?? User(id: users.count + 1, name: paidByName)
        
        let unitAmount = amount / CGFloat(participants.count + 1)
        
        participants.forEach { user in
            var user = user
            user.accountBalance -= unitAmount
            paidBy.accountBalance += unitAmount
            
            let transaction = Transactions(type: .given, amount: unitAmount, user: user)
            paidBy.transaction.append(transaction)
            
            let borrowerTranscation = Transactions(type: .taken, amount: unitAmount, user: paidBy)
            user.transaction.append(transaction)
        }
        
        // Need to clear participants list once the expanse is added
        self.participants.removeAll()
    }
    
    internal func getUsers() -> [User] {
        users
    }
    
    internal func getParticipants() -> [User] {
        participants
    }
}

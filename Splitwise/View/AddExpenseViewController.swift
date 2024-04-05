//
//  AddExpenseViewController.swift
//  Splitwise
//
//  Created by Akash Tiwari on 05/04/24.
//

import UIKit

class AddExpenseViewController: UIViewController {

    @IBOutlet weak var tfExpense: UITextField!
    @IBOutlet weak var tfTotal: UITextField!
    @IBOutlet weak var tfPaidBy: UITextField!
    
    @IBOutlet weak var btnAddParticipants: UIButton!
    @IBOutlet weak var btnAddExpense: UIButton!
    
    @IBOutlet weak var vStackParticipants: UIStackView!
    
    var viewModel: AddExpanseViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel = ExpensesViewModel()
    }
    
    private func addToParticipantsList(participants: String) {
        let lblName = UILabel()
        lblName.translatesAutoresizingMaskIntoConstraints = false
        lblName.text = participants
        vStackParticipants.addArrangedSubview(lblName)
    }
    
    @IBAction func onTapBtnAddParticipants(_ sender: Any) {
        var name: String = ""
        
        let alert = UIAlertController(title: "Add Participants", message: nil, preferredStyle: .actionSheet)
        alert.addTextField { textField in
            name = textField.text ?? ""
        }
        alert.addAction(
            UIAlertAction(title: "Add", style: .default, handler: { [weak self] _ in
                guard let self, !name.isEmpty else { return }
                self.viewModel?.addParticipant(name: name)
                self.addToParticipantsList(participants: name)
            })
        )
    }
    
    @IBAction func onTapBtnAddExpanse(_ sender: Any) {
        guard
            let paidBy = tfPaidBy.text,
            let amount = tfTotal.text as? NSString
        else { return }
        
        viewModel?.addExpanse(paidByName: paidBy, amount: CGFloat(amount.integerValue))
    }
}

//
//  ViewController.swift
//  Splitwise
//
//  Created by Akash Tiwari on 05/04/24.
//

import UIKit

enum Segments: Int {
    case add = 0
    case viewBalance
}
class HomeController: UIViewController {

    @IBOutlet weak var segmentMain: UISegmentedControl!
    @IBOutlet weak var viewContainer: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let currentSegment =  Segments(rawValue: segmentMain.selectedSegmentIndex)
        
        switch currentSegment {
        case .add:
            loadAddExpanseSegment()
        case .viewBalance:
            loadViewBalanceSegment()
        case .none:
            break
        }
    }
    
    private func loadAddExpanseSegment() {
        guard 
            let viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "AddExpenseViewController") as? AddExpenseViewController,
            let childView = viewController.view
        else {
            return
        }
                
        viewContainer.addSubview(childView)
        didMove(toParent: viewController)
    }
    
    private func loadViewBalanceSegment() {
        guard
            let viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ViewBalanceViewController") as? ViewBalanceViewController,
            let childView = viewController.view
        else {
            return
        }
                
        viewContainer.addSubview(childView)
        didMove(toParent: viewController)
    }
}


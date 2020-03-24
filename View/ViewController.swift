//
//  ViewController.swift
//  KivaLoan
//
//  Created by 薛義郎 on 2020/3/24.
//  Copyright © 2020 薛義郎. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var loanViewModels = [LoansViewModel]()
    
    @IBOutlet weak var tableview: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        fetchData()
    }
    
    fileprivate func fetchData() {
        Service.share.fetchLoans { (loans, error) in
            if let error = error {
                print("Failed to fetch loan", error)
                return
            }
            
            self.loanViewModels = loans?.map({return LoansViewModel(loan: $0)}) ?? []
            self.tableview.reloadData()
        }
    }

}

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return loanViewModels.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "loanCell", for: indexPath) as! loansTableViewCell
        
        let loanViewModel = loanViewModels[indexPath.row]
        cell.loanViewModel = loanViewModel
        
        return cell
    }

}


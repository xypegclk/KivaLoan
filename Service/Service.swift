//
//  Service.swift
//  KivaLoan
//
//  Created by 薛義郎 on 2020/3/24.
//  Copyright © 2020 薛義郎. All rights reserved.
//

import Foundation

class Service: NSObject {
    
    static let share = Service()
    
    func fetchLoans(completion: @escaping([Loan]?, Error?) -> ()) {
        var loans = [Loan]()
        
        let urlString = "https://api.kivaws.org/v1/loans/newest.json"
        guard let url = URL(string: urlString) else {return}
        URLSession.shared.dataTask(with: url) { (data, respone, error) in
            if let error = error {
                completion(nil, error)
                print("Failed to fetch loans", error)
                return
            }
            
            guard let data = data else {return}
            do {
                let loanDataStore = try JSONDecoder().decode(LoanDataStore.self, from: data)
                loans = loanDataStore.loans
                DispatchQueue.main.async {
                    completion(loans, nil)
                }
            }catch let jsonError {
                print("Failed to decoder", jsonError)
            }
        }.resume()
    }
}

//
//  loan.swift
//  KivaLoan
//
//  Created by 薛義郎 on 2020/3/24.
//  Copyright © 2020 薛義郎. All rights reserved.
//

import Foundation


struct Loan: Codable {
    
    var name: String
    var country: String
    var use: String
    var amount: Int
    
    enum codingKeys: String, CodingKey {
        case name
        case country = "location"
        case use
        case amount = "loan_amount"
    }
    
    enum LocationKeys: String, CodingKey {
        case country
    }
    
    init(from decoder: Decoder) throws {
        let value = try decoder.container(keyedBy: codingKeys.self)
        
        name = try value.decode(String.self, forKey: .name)
        
        let location = try value.nestedContainer(keyedBy: LocationKeys.self, forKey: .country)
        country = try location.decode(String.self, forKey: .country)
        
        use = try value.decode(String.self, forKey: .use)
        
        amount = try value.decode(Int.self, forKey: .amount)
    }
    
}


struct LoanDataStore: Codable {
    var loans: [Loan]
}

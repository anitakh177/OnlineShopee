//
//  EmailValidator.swift
//  OnlineShoppee
//
//  Created by anita on 3/11/23.
//

import Foundation

extension String {
    func isValidEmail() -> Bool {
        
        let regex = try? NSRegularExpression(pattern: #"^\S+@\S+\.\S+$"#, options: .caseInsensitive)
        return regex?.firstMatch(in: self, options: [], range: NSRange(location: 0, length: count)) != nil
    }
}

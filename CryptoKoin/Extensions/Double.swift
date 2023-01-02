//
//  Double.swift
//  SwiftCoin
//
//  Created by Rakha Fatih Athallah on 25/10/22.
//

import Foundation

extension Double {
    
    private var currencyFormatter : NumberFormatter {
        let formatter = NumberFormatter()
        formatter.usesGroupingSeparator = true
        formatter.locale = Locale(id_Id)
        formatter.numberStyle = .currency
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 2
        return formatter
    }
    
    private var numberFormatter : NumberFormatter {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 2
        return formatter
    }
    
    func toCurrency() -> String {
        return currencyFormatter.string(for: self) ?? "Rp0.00"
    }
    
    func toPercentString() -> String {
        guard let numberAsString = numberFormatter.string(for: self) else { return ""}
        return numberAsString + "%"
    }
    
}

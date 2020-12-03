//
//  AddCoffereViewModel.swift
//  MVVMCoffeeShop
//
//  Created by Ali Elkoca on 2.12.2020.
//

import Foundation


struct AddCoffeOrderViewModel {
    
    var name: String?
    var email: String?
    
    var selectedType: String?
    var selecteedSize: String?
     
    var types: [String] {
        return CoffeeType.allCases.map{ $0.rawValue.capitalized }
    }
    
    var sizes : [String] {
        return CoffeeSize.allCases.map{ $0.rawValue.capitalized}
    }
    
    
}

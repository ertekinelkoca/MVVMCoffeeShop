//
//  AddOrderViewController.swift
//  MVVMCoffeeShop
//
//  Created by Ali Elkoca on 25.11.2020.
//

import Foundation
import UIKit

class AddOrderViewController: UIViewController ,UITableViewDelegate, UITableViewDataSource {
    
    
    private var vm = AddCoffeOrderViewModel()
    
    @IBOutlet weak var tableview: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //we do not need below , because we already did in the mainstoryboard.
        //self.tableview.delegate = self
        //self.tableview.dataSource = self
    }
    
    
  
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.vm.types.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableview.dequeueReusableCell(withIdentifier: "CoffeeTypeTableViewCell", for : indexPath)
        cell.textLabel?.text = self.vm.types[indexPath.row]
        return cell
    }
    
    
}


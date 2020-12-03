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
    
    private var coffeeSizeSegmentedControler : UISegmentedControl!
    
    @IBOutlet weak var tableview: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //we do not need below , because we already did in the mainstoryboard.
        //self.tableview.delegate = self
        //self.tableview.dataSource = self
        setupUI()
        
    }
    
    private func setupUI(){
        
        self.coffeeSizeSegmentedControler = UISegmentedControl(items: self.vm.sizes)
        self.coffeeSizeSegmentedControler.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(self.coffeeSizeSegmentedControler)
        self.coffeeSizeSegmentedControler.topAnchor.constraint(equalTo: self.tableview.bottomAnchor,constant: 20).isActive = true
        self.coffeeSizeSegmentedControler.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableview.cellForRow(at: indexPath)?.accessoryType = .checkmark
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        tableview.cellForRow(at: indexPath)?.accessoryType = .none
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


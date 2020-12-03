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
    
    private var coffeeSizeSegmentedController : UISegmentedControl!
    
    @IBOutlet weak var tableview: UITableView!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //we do not need below , because we already did in the mainstoryboard.
        //self.tableview.delegate = self
        //self.tableview.dataSource = self
        setupUI()
        
    }
    
    private func setupUI(){
        
        self.coffeeSizeSegmentedController = UISegmentedControl(items: self.vm.sizes)
        self.coffeeSizeSegmentedController.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(self.coffeeSizeSegmentedController)
        self.coffeeSizeSegmentedController.topAnchor.constraint(equalTo: self.tableview.bottomAnchor,constant: 20).isActive = true
        self.coffeeSizeSegmentedController.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
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
    
    @IBAction func save(){
        
        let name = self.nameTextField.text
        let email = self.emailTextField.text
        
        let selectedSize = self.coffeeSizeSegmentedController.titleForSegment(at: self.coffeeSizeSegmentedController.selectedSegmentIndex)
        
        guard let indexPath = self.tableview.indexPathForSelectedRow else {
            
            fatalError("Error in selecting coffee")
        }
        
        self.vm.name = name
        self.vm.email = email
        
        self.vm.selecteedSize = selectedSize
        self.vm.selectedType = vm.types[indexPath.row]
        
        WebService().load(resource: Order.create(vm: self.vm)) { result in
            
            switch result {
            case .success(let order): print(order)
            case .failure(let error): print(error)
            }
        
        }
    
    }
}


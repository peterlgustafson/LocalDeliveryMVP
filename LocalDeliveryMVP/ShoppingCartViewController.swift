//
//  ShoppingCartViewController.swift
//  LocalDeliveryMVP
//
//  Created by Peter Gustafson on 8/7/18.
//  Copyright © 2018 Peter Gustafson. All rights reserved.
//

import UIKit

class ShoppingCartViewController: UIViewController {
    
    //Variable to store User Order Dictionary
    var userOrder: [String: Double] = [:]
    
    //Outlets to keep track of user selected items
    
    @IBOutlet weak var userFirstSelectedItem: UILabel!
    
    @IBOutlet weak var userFirstItemSelectedPrice: UILabel!
    
    //Outlets for keep track of Subtotal and Total
    
    @IBOutlet weak var subtotalLabel: UILabel!
    
    
    @IBOutlet weak var finalTotalLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        loadUserSelectedItems()
        
        calculateSubTotal()
        
        calculateFinalTotal()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //Method to Load User Selected Items into Cart
    func loadUserSelectedItems() {
        let userSelectedItemsArray = Array(userOrder.keys)
        userFirstSelectedItem.text = String(userSelectedItemsArray[0])
        
        let userSelectedItemsPricesArray = Array(userOrder.values)
        userFirstItemSelectedPrice.text = "$ " + String(userSelectedItemsPricesArray[0])
    }
    
    func calculateSubTotal() {
        
        let pricesOfAllUserSelectedItemsArray = Array(userOrder.values)
        
        let userItemsSelectedSubtotal : Double = pricesOfAllUserSelectedItemsArray.reduce(0, +)
        
        subtotalLabel.text = "$ " + String(NSString(format: "%.2f", userItemsSelectedSubtotal))
        
    }
    
    func calculateFinalTotal() {
        
    let pricesOfAllUserSelectedItemsArray = Array(userOrder.values)
        
    let userItemsSelectedSubtotal : Double = pricesOfAllUserSelectedItemsArray.reduce(0, +)
        
    let totalPriceWithTax = userItemsSelectedSubtotal + 5
        
        finalTotalLabel.text = "$ " + String(NSString(format: "%.2f",  totalPriceWithTax))

    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

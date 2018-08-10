//
//  ArugulaViewController.swift
//  LocalDeliveryMVP
//
//  Created by Peter Gustafson on 8/7/18.
//  Copyright © 2018 Peter Gustafson. All rights reserved.
//

import UIKit

class ArugulaViewController: UIViewController {
    
    //Variable to store User Order Dictionary
    var userOrder: [String: Double] = [:]
    
    @IBAction func arugulaAdded(_ sender: Any) {
        userOrder["Arugula"] = 4.99
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func checkOutButtonPressed(_ sender: Any) {
        
        performSegue(withIdentifier: "goToShoppingCartFromArugula", sender: self)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "goToShoppingCartFromArugula" {
            let destinationVC = segue.destination as! ShoppingCartViewController
            
            destinationVC.userOrder = userOrder
            
        }
        
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

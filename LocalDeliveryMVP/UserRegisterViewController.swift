//
//  UserRegisterViewController.swift
//  LocalDeliveryMVP
//
//  Created by Peter Gustafson on 8/6/18.
//  Copyright © 2018 Peter Gustafson. All rights reserved.
//

import UIKit
import Firebase

class UserRegisterViewController: UIViewController {
    
    //Outlets for User Email and Password
    
    @IBOutlet weak var userEmailTextField: UITextField!
    
    @IBOutlet weak var userPasswordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func userRegistrationButtonTapped(_ sender: Any) {
        
        Auth.auth().createUser(withEmail: userEmailTextField.text!, password: userPasswordTextField.text!) { (user, error) in
            if error != nil {
                print(error)
            } else {
                print("Registration successful!")
                
                self.performSegue(withIdentifier: "goToHomeFromUserRegistration", sender: self)
            }
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

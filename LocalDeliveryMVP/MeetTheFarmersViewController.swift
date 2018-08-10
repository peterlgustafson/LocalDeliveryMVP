//
//  MeetTheFarmersViewController.swift
//  LocalDeliveryMVP
//
//  Created by Peter Gustafson on 8/7/18.
//  Copyright © 2018 Peter Gustafson. All rights reserved.
//

import UIKit
import SafariServices

class MeetTheFarmersViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func learnMoreButtonTapped(_ sender: Any) {
        
        if let url = URL(string: "https://www.youtube.com/watch?v=0NG7DAqggBw") {
        let safariViewController = SFSafariViewController(url:
            url)
        present(safariViewController, animated: true,
                completion: nil)
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

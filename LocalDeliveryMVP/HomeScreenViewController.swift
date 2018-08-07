//
//  HomeScreenViewController.swift
//  LocalDeliveryMVP
//
//  Created by Peter Gustafson on 8/6/18.
//  Copyright © 2018 Peter Gustafson. All rights reserved.
//

import UIKit
import Firebase
import CoreLocation

class HomeScreenViewController: UIViewController, CLLocationManagerDelegate {
    
    //Instance Variables - Creating Object based on CLLocationManger class
    let locationManager = CLLocationManager()
    
    //Pre-linked IBOutlets
    @IBOutlet weak var cityLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func logOutButtonPressed(_ sender: Any) {
        
        do {
            try Auth.auth().signOut()
            
            navigationController?.popToRootViewController(animated: true)
        } catch {
            print("There was an error signing out.")
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
    
    //MARK: - Location Manager Delegate Methods
    
    //DidUpdateLocation Method
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location = locations[locations.count - 1]
        //To make sure location is valid - if horizontal accuracy is below 0 -> invalid result
        if location.horizontalAccuracy > 0 {
            //To save memory stop updating location once we have user coordinates
            locationManager.stopUpdatingLocation()
            
            print("longitude = \(location.coordinate.longitude), latitude = \(location.coordinate.latitude)")
            
            lookUpCurrentLocation { geoLoc in
                print(geoLoc?.locality ?? "Location unavailable")
                self.cityLabel.text = String(geoLoc?.locality ?? "Location unavailable")
            }
            
        }
    }
    
    //Did Fair with Error Method for Troubleshooting Grabbing User Location
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
//        cityLabel.text = "Location Unavailable"
    }
    
    //Built in Apple Method to get more user friendly location name, e.g. city name
    func lookUpCurrentLocation(completionHandler: @escaping (CLPlacemark?)
        -> Void ) {
        // Use the last reported location.
        if let lastLocation = self.locationManager.location {
            let geocoder = CLGeocoder()
            
            // Look up the location and pass it to the completion handler
            geocoder.reverseGeocodeLocation(lastLocation,
                                            completionHandler: { (placemarks, error) in
                                                if error == nil {
                                                    let firstLocation = placemarks?[0]
                                                    completionHandler(firstLocation)
                                                }
                                                else {
                                                    // An error occurred during geocoding.
                                                    completionHandler(nil)
                                                }
            })
        }
        else {
            // No location was available.
            completionHandler(nil)
        }
    }

}

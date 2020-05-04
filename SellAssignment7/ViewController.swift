//
//  ViewController.swift
//  SellAssignment7
//
//  Created by Remy Sell on 5/4/20.
//  Copyright © 2020 Remy Sell. All rights reserved.
//

import UIKit
import CoreLocation




class ViewController: UIViewController, CLLocationManagerDelegate {
    
    
    @IBOutlet weak var distanceLabel: UILabel!
    
    
    
    let locMan: CLLocationManager = CLLocationManager()
    var startLocation: CLLocation!
    
    let PLParkLat: CLLocationDegrees = 41.3107
    let PLParkLong: CLLocationDegrees = -75.2074
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        let newLocation: CLLocation=locations[0]
        NSLog("Something is up")
        
    if
        newLocation.horizontalAccuracy >= 0 {
        
        let PLand:CLLocation = CLLocation(latitude: PLParkLat, longitude: PLParkLong)
        let delta:CLLocationDistance = PLand.distance(from: newLocation)
        let miles: Double = (delta * 0.000621371) + 0.5
        
        if miles < 3 {
            locMan.stopUpdatingLocation()
            distanceLabel.text = "Enjoy Promised Land State Park!"
        } else {
            let commaDelimited: NumberFormatter = NumberFormatter()
            commaDelimited.numberStyle = NumberFormatter.Style.decimal
            
                
            distanceLabel.text=commaDelimited.string(from: NSNumber(value: miles))!+"miles to Promised Land"
        }
        
        
    }
    else
    {
        distanceLabel.text = "ERROR"
    }
}
        

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        locMan.delegate = self
        locMan.desiredAccuracy = kCLLocationAccuracyThreeKilometers
        locMan.distanceFilter = 1609
        
        locMan.requestWhenInUseAuthorization()
        locMan.startUpdatingLocation()
        startLocation = nil
    }


}


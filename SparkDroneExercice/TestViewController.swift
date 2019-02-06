//
//  TestViewController.swift
//  SparkDroneExercice
//
//  Created by Vincent Riva on 06/02/2019.
//  Copyright © 2019 Vincent Riva. All rights reserved.
//

import Foundation
import UIKit
import DJISDK

class TestViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func takeOff(_ sender: Any) {
        MovementManager.shared.takeOff()
    }
    
    @IBAction func activateMode(_ sender: Any) {
        if let spark = DJISDKManager.product() as? DJIAircraft {
            spark.flightController?.flightAssistant?.setAdvancedGestureControlEnabled(true) { err in
                if let error = err {
                    print("Error: \(error)")
                } else {
                    print("Flight Assistant On")
                }
            }
        }
    }
    
    @IBAction func stop(_ sender: Any) {
        MovementManager.shared.stop()
    }
    
    @IBAction func normalLand(_ sender: Any) {
        MovementManager.shared.land()
    }
}

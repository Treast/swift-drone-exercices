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
    
    @IBOutlet weak var movementLabel: UILabel!
    @IBOutlet weak var rotationLabel: UILabel!
    @IBOutlet weak var movementFactor: UISlider!
    
    @IBOutlet weak var rotationFactor: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func changeMovementFactor(_ sender: Any) {
        movementLabel.text = "Movement speed (\(movementFactor.value))"
    }
    
    @IBAction func changeRotationFactor(_ sender: Any) {
        rotationLabel.text = "Rotation speed (\(rotationFactor.value))"
    }
    
    @IBAction func run(_ sender: Any) {
        MovementManager.shared.speedFactor = movementFactor.value
        MovementManager.shared.rotationFactor = rotationFactor.value
        MovementManager.shared.reset()
        MovementManager.shared.appendMovement(movement: Movement(direction: .Circle, duration: 0))
        MovementManager.shared.play()
    }
    
    @IBAction func takeOff(_ sender: Any) {
        MovementManager.shared.takeOff()
    }
    
    @IBAction func stop(_ sender: Any) {
        MovementManager.shared.reset()
        MovementManager.shared.stop()
    }
    
    @IBAction func normalLand(_ sender: Any) {
        MovementManager.shared.stop()
        MovementManager.shared.land()
    }
}

//
//  Exercice2ViewController.swift
//  SparkDroneExercice
//
//  Created by Vincent Riva on 06/02/2019.
//  Copyright © 2019 Vincent Riva. All rights reserved.
//

import Foundation
import UIKit

class Exercice2ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func run(_ sender: Any) {
        MovementManager.shared.speedFactor = 0.125
        MovementManager.shared.rotationFactor = 0.625
        MovementManager.shared.reset()
        MovementManager.shared.appendAction(action: Action(action: .TakeOff, duration: 0))
        MovementManager.shared.appendMovement(movement: Movement(direction: .Circle, duration: 5))
        MovementManager.shared.play()
    }
    
    @IBAction func stop(_ sender: Any) {
        MovementManager.shared.reset()
        MovementManager.shared.stop()
    }
    
    @IBAction func land(_ sender: Any) {
        MovementManager.shared.reset()
        MovementManager.shared.stop()
        MovementManager.shared.land()
    }
}

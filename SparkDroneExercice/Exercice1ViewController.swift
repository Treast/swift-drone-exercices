//
//  ViewController.swift
//  SparkDroneExercice
//
//  Created by Vincent Riva on 06/02/2019.
//  Copyright © 2019 Vincent Riva. All rights reserved.
//

import UIKit
import DJISDK
import VideoPreviewer

class Exercice1ViewController: UIViewController {

    @IBOutlet weak var cameraView: UIView!
    @IBOutlet weak var snapshotView1: UIImageView!
    @IBOutlet weak var snapshotView2: UIImageView!
    
    var previewer = VideoPreviewer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        defineSequence()
    }
    
    func defineSequence() {
        MovementManager.shared.reset()
        
        MovementManager.shared.appendAction(action: Action(action: .TakeOff, duration: 0))
        MovementManager.shared.appendAction(action: Action(action: .None, duration: 11))
        MovementManager.shared.appendAction(action: Action(action: .CameraDown, duration: 1))
        MovementManager.shared.appendAction(action: Action(action: .Custom, duration: 1) {
            self.takeScreenshot()
        })
        MovementManager.shared.appendAction(action: Action(action: .CameraUp, duration: 1))
        MovementManager.shared.appendAction(action: Action(action: .None, duration: 1))
        MovementManager.shared.appendAction(action: Action(action: .CameraDown, duration: 21))
        MovementManager.shared.appendAction(action: Action(action: .Custom, duration: 1) {
            self.takeScreenshot()
        })
        MovementManager.shared.appendAction(action: Action(action: .CameraUp, duration: 1))
        MovementManager.shared.appendAction(action: Action(action: .Land, duration: 2))
        
        MovementManager.shared.appendMovement(movement: Movement(direction: .Stop, duration: 0))
        MovementManager.shared.appendMovement(movement: Movement(direction: .RotateUp, duration: 5))
        MovementManager.shared.appendMovement(movement: Movement(direction: .Stop, duration: 8))
        MovementManager.shared.appendMovement(movement: Movement(direction: .Back, duration: 3))
        MovementManager.shared.appendMovement(movement: Movement(direction: .Down, duration: 6))
        MovementManager.shared.appendMovement(movement: Movement(direction: .Front, duration: 8))
        MovementManager.shared.appendMovement(movement: Movement(direction: .Up, duration: 6))
        MovementManager.shared.appendMovement(movement: Movement(direction: .Stop, duration: 2))
        
        MovementManager.shared.speedFactor = 0.2
    }
    
    @IBAction func runAction(_ sender: Any) {
        MovementManager.shared.play()
    }
    
    @IBAction func stopAction(_ sender: Any) {
        MovementManager.shared.stop()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if let spark = DJISDKManager.product() as? DJIAircraft {
            spark.camera?.delegate = self
            spark.gimbal?.delegate = self
            setupPreviewVideo()
        }
    }
    
    func setupPreviewVideo() {
        previewer?.setView(cameraView)
        if let _ = DJISDKManager.product(){
            DJISDKManager.videoFeeder()?.primaryVideoFeed.add(self, with: nil)
        }
        previewer?.start()
    }


    
    func takeScreenshot() {
        self.previewer?.snapshotThumnnail { (image) in
            if let img = image {
                if let snapshot1 = self.snapshotView1.image {
                    self.snapshotView2.image = img
                } else {
                    self.snapshotView1.image = img
                }
            }
        }
    }
}

extension Exercice1ViewController: DJIVideoFeedListener {
    func videoFeed(_ videoFeed: DJIVideoFeed, didUpdateVideoData videoData: Data) {
        videoData.withUnsafeBytes { (bytes:UnsafePointer<UInt8>) in
            previewer?.push(UnsafeMutablePointer(mutating: bytes), length: Int32(videoData.count))
        }
    }
}

extension Exercice1ViewController: DJICameraDelegate {
    
}

extension Exercice1ViewController: DJIGimbalDelegate {
    
}


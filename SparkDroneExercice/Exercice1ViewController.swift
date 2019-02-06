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


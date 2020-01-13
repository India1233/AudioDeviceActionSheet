

//  ViewController.swift
//  AudioDeviceActionSheet

//  Created by Suresh Shiga on 13/01/20.
//  Copyright © 2020 Test. All rights reserved.

 import UIKit
import AVFoundation

class ViewController: UIViewController  {
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    @IBAction func pressAudio(_ sender: Any) {
        setupAudioDevice()
    }
    
    
    private func setupAudioDevice() {
    
        let model = UIDevice.current.model
        
        let session = AVAudioSession()
        
        let controller = UIAlertController(title: "Select Output", message: "", preferredStyle: .actionSheet)
        controller.addAction(UIAlertAction(title: model, style: .default, handler: { action in
            do {
                try session.setCategory(AVAudioSession.Category.playAndRecord, mode: AVAudioSession.Mode.default, options: AVAudioSession.CategoryOptions.defaultToSpeaker)
            } catch {
                print("AVAudioSession error!")
            }
        }))
        controller.addAction(UIAlertAction(title: "Bluetooth", style: .default, handler: { action in
            do {
                try session.setCategory(AVAudioSession.Category.playAndRecord, mode: AVAudioSession.Mode.default,  options: AVAudioSession.CategoryOptions.allowBluetooth)
            } catch {
                print("AVAudioSession error!")
            }
        }))
        
        present(controller, animated: true, completion: nil)
}


}



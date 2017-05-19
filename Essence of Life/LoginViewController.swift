//
//  LoginViewController.swift
//  Essence of Life
//
//  Created by rkalvani on 4/20/17.
//  Copyright © 2017 Les Lentilz. All rights reserved.
//
//vaccinations, medcations, insurance #, different doctor office contact info - last appointment, family history, blood type

import UIKit
import LocalAuthentication
import AVFoundation



class LoginViewController: UIViewController
{
    
  var backgroundSounds:AVAudioPlayer = AVAudioPlayer()

    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        
        do
        {
            let audioPath = Bundle.main.path(forResource: "waves", ofType: "mp3")
            try backgroundSounds = AVAudioPlayer(contentsOf: NSURL(fileURLWithPath: audioPath!) as URL)
            backgroundSounds.numberOfLoops = -1
            backgroundSounds.play()
        }
        catch
        {
            //ERROR
        }
        
       
    }

    @IBAction func loginAction(_ sender: Any) {
        authenticateUser()
        
    }
   
    func authenticateUser() {
        let context = LAContext()
        var error: NSError?
        
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            let reason = "Identify yourself!"
            
            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) {
                [unowned self] success, authenticationError in
                
                DispatchQueue.main.async {
                    if success {
                        print("IDENTIFIED!")
                        self.performSegue(withIdentifier: "Logged", sender: nil)
                    } else {
                        let ac = UIAlertController(title: "Authentication failed", message: "Sorry!", preferredStyle: .alert)
                        ac.addAction(UIAlertAction(title: "OK", style: .default))
                        self.present(ac, animated: true)
                    }
                }
            }
        } else {
            let ac = UIAlertController(title: "Touch ID not available", message: "Your device is not configured for Touch ID.", preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "OK", style: .default))
            present(ac, animated: true)
        }
    }

}

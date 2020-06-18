//
//  ViewController.swift
//  UIExamples
//
//  Created by Anderson Malaguitte on 18/06/2020.
//  Copyright © 2020 Anderson. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let ALERT_CONTROLLER_CONFIG = (title: "Alert Title", message: "Alert Message")
    let ALERT_ACTION_TITLE: String = "OK"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func didPressActivityViewButton(_ sender: Any) {
        let activityView = UIActivityViewController(activityItems: ["Data From My Application"], applicationActivities: nil)
        present(activityView, animated: true, completion: nil)
    }
    
    @IBAction func didPressAlertButton(_ sender: Any) {
        //define alert
        let alertController = UIAlertController(title: ALERT_CONTROLLER_CONFIG.title, message: ALERT_CONTROLLER_CONFIG.message, preferredStyle: .alert)
        
        let alertAction = UIAlertAction(title: ALERT_ACTION_TITLE, style: .cancel) { (action) in
            print("Done!")
        }
        
        alertController.addAction(alertAction)
        //shows alert
        present(alertController, animated: true, completion: nil)
    }
}


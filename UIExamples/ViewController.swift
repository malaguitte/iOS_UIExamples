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
    let MAX_PROGRESS: Float = 1.0
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var progressView: UIProgressView!
    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.createCustomButton()
    }
    
    @IBAction func switchDidChange(_ sender: UISwitch) {
        label.text = sender.isOn ? "ON" : "OFF"
    }

    @IBAction func sliderDidChange(_ sender: UISlider) {
        //syncing the slider with the progress bar
        progressView.progress = sender.value
        progressView.progress >= MAX_PROGRESS
            ? activityIndicator.stopAnimating()
            : activityIndicator.startAnimating()
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
    
    func createCustomButton() {
        let button = UIButton(type: .system)
        button.frame = CGRect(x: 200, y: 100, width: 100, height: 20)
        button.setTitle("My Button", for: .normal)
        view.addSubview(button)
        //connect it with our action
        button.addTarget(self, action: #selector(customButtonWasPressed), for: .touchUpInside)
    }
    
    @objc func customButtonWasPressed(_ sender: UIButton) {
        print("Custom Button Was Pressed!")
    }
}


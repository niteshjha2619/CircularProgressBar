//
//  ViewController.swift
//  CircularProgressBar
//
//  Created by Nitesh jha on 26/04/21.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var circularProgress: CircularProgressView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        circularProgress.trackClr = UIColor.black
        circularProgress.progressClr = UIColor.red
        let progress = (1.00 * (60 / 100))
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            self.circularProgress.setProgressWithAnimation(duration: 1.0, value: Float(progress))
        }
    }
}


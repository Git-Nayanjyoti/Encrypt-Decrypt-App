//
//  ViewController.swift
//  Data Security
//
//  Created by NAYANJYOTI RABHA on 15/05/20.
//  Copyright © 2020 NAYANJYOTI RABHA. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func didTapButton() {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "CeaserViewController") as! CeaserViewController
        
        self.navigationController?.pushViewController(vc, animated: true)
    }
   
    
    
}


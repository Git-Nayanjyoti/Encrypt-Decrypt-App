//
//  PlayfairViewController.swift
//  Data Security
//
//  Created by NAYANJYOTI RABHA on 15/05/20.
//  Copyright © 2020 NAYANJYOTI RABHA. All rights reserved.
//

import UIKit

class PlayfairViewController: UIViewController {

    
    @IBOutlet var Plaintext: UITextField!
    @IBOutlet var key: UITextField!
    @IBOutlet var encryptview: UITextView!
    @IBOutlet var decryptview: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBAction func encrypt(_ sender: UIButton) {
        let PlainText = String(Plaintext.text!)
        let key1 = String(key.text!)
               let output = PlayFairObj.Encrypt(plaintext: PlainText, key: key1)
               encryptview.text = output
    }
    @IBAction func decrypt(_ sender: UIButton) {
        let PlainText = String(Plaintext.text!)
        let key1 = String(key.text!)
               let ciphertext = PlayFairObj.Encrypt(plaintext: PlainText, key: key1)
               let output = PlayFairObj.Decrypt(plaintext: ciphertext, key: key1)
               decryptview.text = output
    }
    
}

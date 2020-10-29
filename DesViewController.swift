//
//  DesViewController.swift
//  Data Security
//
//  Created by NAYANJYOTI RABHA on 15/05/20.
//  Copyright © 2020 NAYANJYOTI RABHA. All rights reserved.
//

import UIKit

class DesViewController: UIViewController{
    
    @IBOutlet var key: UITextField!
    @IBOutlet var plaintext: UITextField!
    @IBOutlet var encryptview: UITextView!
    @IBOutlet var decryptview: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    @IBAction func encrypt(_ sender: UIButton) {
        let TripleDES = CryptoJS.TripleDES()
        
        let PlainText = String(plaintext.text!)
        let key1 = String(key.text!)
        let DESencrypted = TripleDES.encrypt(PlainText, password: key1)
        encryptview.text = DESencrypted
    }
    
    @IBAction func decrypt(_ sender: UIButton) {
        let TripleDES = CryptoJS.TripleDES()
        let PlainText = String(plaintext.text!)
        let key1 = String(key.text!)
        let ciphertext = TripleDES.encrypt(PlainText, password: key1)
        let output = TripleDES.decrypt(ciphertext, password: key1)
        decryptview.text = output
    }
    
    
}

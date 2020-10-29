//
//  CeaserViewController.swift
//  Data Security
//
//  Created by NAYANJYOTI RABHA on 15/05/20.
//  Copyright © 2020 NAYANJYOTI RABHA. All rights reserved.
//
import UIKit


class CeaserViewController: UIViewController {
    
    @IBOutlet var Plaintext: UITextField!
    @IBOutlet var key: UITextField!
    @IBOutlet var veiwencryptedtext: UITextView!
    @IBOutlet var viewdecryptedtext: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    @IBAction func encrypt(_ sender: UIButton) {
        let PlainText = String(Plaintext.text!)
               let key1 = Int(key.text!)!
        let output = CaeserObj.CCEncrypt(plaintext: PlainText, key: key1)
        veiwencryptedtext.text = output
    }
    
    @IBAction func decrypt(_ sender: UIButton) {
        
        let PlainText = String(Plaintext.text!)
        let key1 = Int(key.text!)!
        let ciphertext =  CaeserObj.CCEncrypt(plaintext: PlainText, key: key1)
        let output = CaeserObj.CCDecrypt(ciphertext: ciphertext, key: key1)
        viewdecryptedtext.text = output
    }
    
}

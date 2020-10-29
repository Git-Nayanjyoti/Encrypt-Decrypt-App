//
//  CaeserCipherAlgo.swift
//  MYAPP
//
//  Created by NAYANJYOTI RABHA on 14/05/20.
//  Copyright © 2020 NAYANJYOTI RABHA. All rights reserved.
//

import Foundation
import UIKit

var CaeserObj = Caeser()

class Caeser {

func CCEncrypt(plaintext: String, key: Int) -> String{
    
    var result = [String]()
    var Temp = [String]()
    var tempstring = [String]()
    let key:Int = key
    let Alphabets = (0..<26).map({String(UnicodeScalar("A".unicodeScalars.first!.value + $0)!)})
    let PlainText = Array(plaintext)
    for i in 0..<PlainText.count{
       tempstring.append("\(PlainText[i].uppercased())")
    }
    for i in 0..<PlainText.count {
        if(PlainText[i] == " "){
            Temp.append(" ")
      }else{
      let NewIndex = Alphabets.firstIndex(of: "\(tempstring[i])")
      let v = (NewIndex! + key) % 26
      Temp.append("\(v)")
     }
   }
   for i in 0..<PlainText.count {
     let x = (Temp[i])
     if( x == " ") {
        result.append(" ")
     }
     else{
        let s = Int(x) ?? 0
        result.append("\(Alphabets[s])")
        }
    }
  
    for i in 0..<PlainText.count {
       if("\(PlainText[i])" == "\(PlainText[i].uppercased())"){
          result[i] = result[i].uppercased()
       }else{
          result[i] = result[i].lowercased()
      }
    }

   let CipherText:String = result.joined()
   return CipherText

}

func CCDecrypt(ciphertext: String, key: Int) -> String{
    
    var result = [String]()
    var Temp = [String]()
    var tempstring = [String]()
    let key:Int = key
    let Alphabets = (0..<26).map({String(UnicodeScalar("A".unicodeScalars.first!.value + $0)!)})
    let CipherText = Array(ciphertext)
    for i in 0..<CipherText.count{
       tempstring.append("\(CipherText[i].uppercased())")
    }
    for i in 0..<CipherText.count {
        if(CipherText[i] == " "){
            Temp.append(" ")
      }else{
      let NewIndex = Alphabets.firstIndex(of: "\(tempstring[i])")
      let v = (NewIndex! - key) % 26
      Temp.append("\(v)")
     }
   }
   for i in 0..<CipherText.count {
     let x = (Temp[i])
     if( x == " ") {
        result.append(" ")
     }
     else{
        let s = Int(x) ?? 0
        result.append("\(Alphabets[s])")
        }
    }
  
    for i in 0..<CipherText.count {
       if("\(CipherText[i])" == "\(CipherText[i].uppercased())"){
          result[i] = result[i].uppercased()
       }else{
          result[i] = result[i].lowercased()
      }
    }

   let PlainText:String = result.joined()
   return PlainText

}
}

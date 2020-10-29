//
//  PlayfairAlgo.swift
//  Data Security
//
//  Created by NAYANJYOTI RABHA on 15/05/20.
//  Copyright © 2020 NAYANJYOTI RABHA. All rights reserved.
//

import UIKit

var PlayFairObj = PlayFairCipher()



extension Array where Element: Equatable{
       func removeDuplicate() -> Array{
            return reduce(into: []){
              result, element in
              if !result.contains(element){
                 result.append(element)
               }
            }
        }
    }

extension Array where Element: Equatable {
  // Remove first collection element that is equal to the given `object`:
   mutating func remove(object: Element) {
    guard let index = firstIndex(of: object) else {return}
    remove(at: index)
   }
}




// Make uppercase
 func uppercase(array: [String]) -> [String]{
     var newarray = [String]()
     for elements in 0..<array.count {
         newarray.append(array[elements].uppercased())
    }
     return newarray
 }


class PlayFairCipher {

func Encrypt(plaintext: String, key: String) -> String{
    
    var PlainTextArray = Array(plaintext).map{String($0)}
    var Key = Array(key).map{String($0)}
    Key = uppercase(array: Key)
    PlainTextArray = uppercase(array: PlainTextArray)
    var Alphabets = (0..<26).map({String(UnicodeScalar("A".unicodeScalars.first!.value + $0)!)})
    Key.append(contentsOf: Alphabets)
    var NewAlphabets = Key.removeDuplicate()
    NewAlphabets.remove(object: "J")
    
    //remove I or J
        for i in 0...NewAlphabets.count-1{
               if(NewAlphabets[i] == "J"){
                  for j in 0..<NewAlphabets.count{
                      if(NewAlphabets[j] == "I"){
                      NewAlphabets[j] = "J"
                      }
                 }
             }
         }

    

    // Matrix
    
    var Matrix = [[String]](repeating: [String](repeating: "A", count: 5), count: 5)
    for row in 0..<Matrix.count{
    for column in 0..<Matrix.count{
            Matrix[row][column] = NewAlphabets[column + (row*5)]
            }
     }

     // Pairing the Plain-Text
     for i in stride(from: 0, to: PlainTextArray.count-1, by: 2){
           if(PlainTextArray[i] == PlainTextArray[i+1]){
               if(PlainTextArray[i] == "X"){
                   PlainTextArray.insert("Z", at: i+1)
                   }else{
                      PlainTextArray.insert("X", at: i+1)
                    }
                }
            }

     // If the PlainText have odd no. of elements without any repetition then erase the last one
   
     if(PlainTextArray.count % 2 != 0){
        if(PlainTextArray[PlainTextArray.count-1] == "X"){
            PlainTextArray.append("Z")
        }else{
            PlainTextArray.append("X")
        }
       }
   
       var CompareMatrix: [[String]] = Matrix
       var Result = [String]()

         // function for finding the index
      func position(letter: String) -> [Int]{
          var i = 0
          var j = 0
          var array = [Int]()
          for row in 0..<Matrix.count{
              for column in 0..<Matrix.count{
                  if(CompareMatrix[row][column] == letter){
                        i = i + row
                        j = j + column
                        array.append(i)
                        array.append(j)
                       }
                   }
               }
          return array
       }
    
    for pos in stride(from: 0, to: PlainTextArray.count-1, by: 2){
           let pos1 = position(letter: PlainTextArray[pos])
           let row1 = pos1[0]
           let column1 = pos1[1]
           let pos2 = position(letter: PlainTextArray[pos+1])
           let row2 = pos2[0]
           let column2 = pos2[1]
    
         //If letters are in same row
         if(row1 == row2){
             Result.append(CompareMatrix[row1][(column1+1)%5])
             Result.append(CompareMatrix[row2][(column2+1)%5])
         }else{
             // If letters are in same column
              if(column1 == column2){
              Result.append(CompareMatrix[(row1+1)%5][column1])
              Result.append(CompareMatrix[(row2+1)%5][column2])
              }else{
              //If letters are in diagonal position
              Result.append(CompareMatrix[row1][column2])
              Result.append(CompareMatrix[row2][column1])
              }
          }
       }
 
    let CipherText = Result.joined()
    return CipherText
}

func Decrypt(plaintext: String, key: String) -> String{
    
    var PlainTextArray = Array(plaintext).map{String($0)}
    var Key = Array(key).map{String($0)}
    Key = uppercase(array: Key)
    PlainTextArray = uppercase(array: PlainTextArray)
    var Alphabets = (0..<26).map({String(UnicodeScalar("A".unicodeScalars.first!.value + $0)!)})
    Key.append(contentsOf: Alphabets)
    var NewAlphabets = Key.removeDuplicate()
    NewAlphabets.remove(object: "J")
    
    //remove I or J
   
        
        for i in 0...NewAlphabets.count-1{
               if(NewAlphabets[i] == "J"){
                  for j in 0..<NewAlphabets.count{
                      if(NewAlphabets[j] == "I"){
                      NewAlphabets[j] = "J"
                      }
                 }
             }
   
    }
    

    // Matrix
    
    var Matrix = [[String]](repeating: [String](repeating: "A", count: 5), count: 5)
    for row in 0..<Matrix.count{
    for column in 0..<Matrix.count{
            Matrix[row][column] = NewAlphabets[column + (row*5)]
            }
     }

     // Pairing the Plain-Text
     for i in stride(from: 0, to: PlainTextArray.count-1, by: 2){
           if(PlainTextArray[i] == PlainTextArray[i+1]){
               if(PlainTextArray[i] == "X"){
                   PlainTextArray.insert("Z", at: i+1)
                   }else{
                      PlainTextArray.insert("X", at: i+1)
                    }
                }
            }

     // If the PlainText have odd no. of elements without any repetition then erase the last one
    
     if(PlainTextArray.count % 2 != 0){
        if(PlainTextArray[PlainTextArray.count-1] == "X"){
            PlainTextArray.append("Z")
        }else{
            PlainTextArray.append("X")
        }
       }
    
    
       var CompareMatrix: [[String]] = Matrix
       var Result = [String]()
         // function for finding the index
      func position(letter: String) -> [Int]{
          var i = 0
          var j = 0
          var array = [Int]()
          for row in 0..<Matrix.count{
              for column in 0..<Matrix.count{
                  if(CompareMatrix[row][column] == letter){
                        i = i + row
                        j = j + column
                        array.append(i)
                        array.append(j)
                       }
                   }
               }
          return array
       }

    for pos in stride(from: 0, to: PlainTextArray.count-1, by: 2){
           let pos1 = position(letter: PlainTextArray[pos])
           let row1 = pos1[0]
           let column1 = pos1[1]
           let pos2 = position(letter: PlainTextArray[pos+1])
           let row2 = pos2[0]
           let column2 = pos2[1]
    
         //If letters are in same row
         if(row1 == row2){
             Result.append(CompareMatrix[row1][(column1+4)%5])
             Result.append(CompareMatrix[row2][(column2+4)%5])
         }else{
             // If letters are in same column
              if(column1 == column2){
              Result.append(CompareMatrix[(row1+4)%5][column1])
              Result.append(CompareMatrix[(row2+4)%5][column2])
              }else{
              //If letters are in diagonal position
              Result.append(CompareMatrix[row1][column2])
              Result.append(CompareMatrix[row2][column1])
              }
          }
       }

    let CipherText = Result.joined()
    return CipherText
  }

}

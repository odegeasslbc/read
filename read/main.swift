//
//  main.swift
//  read
//
//  Created by 刘炳辰 on 4/9/16.
//  Copyright © 2016 刘炳辰. All rights reserved.
//

import Foundation

var classes:[String:Int] = [
    "1_early-renaissance": 1,
    "2_high-renaissance": 2,
    "3_mannerism-late-renaissance": 3,
    "4_northern-renaissance": 4,
    "5_baroque": 5,
    "6_rococo": 6,
    "7_romanticism":7,
    "8_impressionism": 8,
    "9_post-impressionism": 9,
    "10_realism": 10,
    "11_art-nouveau-modern": 11,
    "12_cubism": 12,
    "13_expressionism": 13,
    "14_symbolism": 14,
    "15_fauvism": 15,
    "16_abstract-expressionism": 16,
    "17_color-field-painting": 17,
    "18_minimalism": 18,
    "19_na-ve-art-primitivism": 19,
    "20_ukiyo-e": 20,
    "21_pop-art": 21, ]


func make_train(){
    let folderPath = "/Users/liubingchen/Researches/merged_images/"

    let distFilePath = "/Users/liubingchen/Researches/train.txt"

    let fileManager = NSFileManager.defaultManager()

    var contents = ""

    
    for (key, value) in classes{
        let classPath = folderPath + key
        print(classPath)
        let enumerator:NSDirectoryEnumerator = fileManager.enumeratorAtPath(classPath)!
        var numberOfImg = 0

        while let element = enumerator.nextObject() as? String {
            if(numberOfImg%9 != 0){
                contents.appendContentsOf("\(key)/\(element) \(value)\n")
            }
            numberOfImg += 1
        }
    }

    let path = distFilePath
    
    //writing
    do {
        try contents.writeToFile(path, atomically: false, encoding: NSUTF8StringEncoding)
    }
    catch {/* error handling here */}
}

func make_val(){
    let folderPath = "/Users/liubingchen/Researches/merged_images/"

    let distPath = "/Users/liubingchen/Researches/val.txt"
    
    let fileManager = NSFileManager.defaultManager()

    var contents = ""
    
    
    for (key, value) in classes{
        let classPath = folderPath + key
        print(classPath)
        let enumerator:NSDirectoryEnumerator = fileManager.enumeratorAtPath(classPath)!
        var nbrOfImg = 0

        while let element = enumerator.nextObject() as? String {
            if(nbrOfImg%9 == 0){
                contents.appendContentsOf("\(key)/\(element) \(value)\n")
            }
            nbrOfImg += 1
        }
    }
    
    let path = distPath
    
    //writing
    do {
        try contents.writeToFile(path, atomically: false, encoding: NSUTF8StringEncoding)
    }
    catch {/* error handling here */}
}

make_train()
make_val()

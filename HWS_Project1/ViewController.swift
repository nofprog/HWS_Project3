//
//  ViewController.swift
//  HWS_Project1
//
//  Created by J on 2021/02/26.
//

import UIKit

class ViewController: UIViewController {
    
    var pictuers = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()

        let fm = FileManager.default
        let path = Bundle.main.resourcePath! //アプリに追加された画像がある場所
        let items = try! fm.contentsOfDirectory(atPath: path)

        for item in items {
            if item.hasPrefix("0") {
                pictuers.append(item)
            }
        }
        
        print(pictuers)
        //["03.webp", "02.webp", "09.webp", "05.webp", "04.webp", "08.webp", "07.webp", "06.webp", "01.webp"]

        
    }


}


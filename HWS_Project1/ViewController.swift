//
//  ViewController.swift
//  HWS_Project1
//
//  Created by J on 2021/02/26.
//

import UIKit

class ViewController: UITableViewController {
    
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

  
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pictuers.count
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(pictuers[indexPath.row])
        
        //viewControllerを読み込む
        if let vc = storyboard?.instantiateViewController(identifier: "Detail") as? DetailViewController {
            //画像をセットする
            vc.selectedImage = pictuers[indexPath.row]
            //画面遷移
            navigationController?.pushViewController(vc, animated: true)
        }
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Picture", for: indexPath)
        cell.textLabel?.text = pictuers[indexPath.row]
        return cell
    }
}


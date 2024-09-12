//
//  ViewController.swift
//  lesson1
//
//  Created by Dmitrii Nazarov on 12.09.2024.
//

import UIKit

class ViewController: UIViewController {

    let networManager = NetworkManager()
     
     override func viewDidLoad() {
         super.viewDidLoad()
         
         networManager.sendRequest(q: "ios разработка", limit: 10)
     }


}


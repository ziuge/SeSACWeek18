//
//  ViewController.swift
//  SeSACWeek18
//
//  Created by CHOI on 2022/11/02.
//

import UIKit

class ViewController: UIViewController {

    let api = APIService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        api.login()
    }


}


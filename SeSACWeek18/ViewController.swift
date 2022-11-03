//
//  ViewController.swift
//  SeSACWeek18
//
//  Created by CHOI on 2022/11/02.
//

import UIKit
import RxSwift

class ViewController: UIViewController { // 프로필 뷰
    
    @IBOutlet weak var label: UILabel!
    let viewModel = ProfileViewModel()
    
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let phone = Phone()
        
        
        viewModel.profile // <Single>, Syntax Sugar
            .withUnretained(self)
            .subscribe { (vc, value) in
                print(value.user.email)
                print(value.user.username)
            } onError: { error in
                print(error.localizedDescription)
            }
            .disposed(by: disposeBag)
        
        // subscribe, bind, drive
        // driver vs signal

        viewModel.getProfile()

        checkCOW()
    }

    // 값 타입 참조 타입 8회차
    // 값 타입이라도 참조를 하는 경우가 있다?
    func checkCOW() {
        var test = "jack"
        address(&test) // in out 매개변수
        
        var test2 = test
        address(&test2)
        
        test2 = "sesac"
        
        address(&test)
        address(&test2)
        
        
        print("=====")
        
        var array = Array(repeating: "A", count: 10) // Array, Dictionary, Set == Collection
        address(&array)
        
        print(array[safe: 9])
        print(array[safe: 10])
        
        var newArray = array // 실제로 복사 안함! 원본을 공유하고 있음
        address(&newArray)
        
        newArray[0] = "B"
        
        address(&array)
        address(&newArray)
        
    }
    
    func address(_ value: UnsafeRawPointer) {
        let address = String(format: "%p", Int(bitPattern: value))
        print(address)
    }

}


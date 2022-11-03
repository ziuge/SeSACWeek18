//
//  SubscriptExample.swift
//  SeSACWeek18
//
//  Created by CHOI on 2022/11/03.
//

import Foundation

extension String {
    subscript (idx: Int) -> String? {
        let result = index(startIndex, offsetBy: idx)
        return String(self[result])
    }
}

extension Collection {
    subscript(safe index: Index) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
}

// let a = [Phone(), Phone()]
// Phone[1]
struct Phone {
    var numbers = ["1234", "5678", "3353", "2222"]
    
    subscript(idx: Int) -> String {
        get {
            return self.numbers[idx]
        }
        set {
            self.numbers[idx] = newValue
        }
    }
}

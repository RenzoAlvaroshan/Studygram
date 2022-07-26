//
//  Extensions.swift
//  Studygram
//
//  Created by Renzo Alvaroshan on 18/07/22.
//

import UIKit

extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

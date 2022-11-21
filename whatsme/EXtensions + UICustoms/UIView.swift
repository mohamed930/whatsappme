//
//  UIView.swift
//  whatsme
//
//  Created by Mohamed Ali on 21/11/2022.
//

import UIKit

extension UIView {
    func SetViewUpdateUI(Color: String, borderWidth: CGFloat, cornerRadious: CGFloat) {
        self.layer.borderColor = UIColor().hexStringToUIColor(hex: Color).cgColor
        self.layer.borderWidth = borderWidth
        self.layer.cornerRadius = cornerRadious
    }
}

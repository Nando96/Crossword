//
//  newbutton.swift
//  midterm
//
//  Created by Fernie on 3/20/19.
//  Copyright © 2019 Poopnose. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable class CustomButton: UIButton {
    @IBInspectable var borderColor: UIColor = UIColor.clear {
        didSet { layer.borderColor = borderColor.cgColor; }
    }
    @IBInspectable var borderWidth: CGFloat = 0 {
        didSet { layer.borderWidth = borderWidth; }
    }
    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet { layer.cornerRadius = cornerRadius; }
    } /*
     // Only override draw() if you perform custom drawing.
     // An empty implementation adversely affects performance during animation.
     override func draw(_ rect: CGRect) {
     // Drawing code
     }
     */ }

//
//  UIButtonExt.swift
//  Goal Check
//
//  Created by Alex Wong on 12/2/17.
//  Copyright © 2017 Alex Wong. All rights reserved.
//

import UIKit

extension UIButton {
    
    func setSelectedColor(){
        self.backgroundColor = #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)
        
    }
    
    func setDeselectedColor(){
        self.backgroundColor = #colorLiteral(red: 0.5843137503, green: 0.8235294223, blue: 0.4196078479, alpha: 1)
    }
}

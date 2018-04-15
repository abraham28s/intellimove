//
//  Globals.swift
//  intellimove
//
//  Created by Abraham Soto on 14/04/18.
//  Copyright © 2018 Abraham. All rights reserved.
//

import Foundation
import UIKit

struct Globals{
    let server:String = "http://intellimove.com.mx:9000"
    
    func hexStringToUIColor (hex:String) -> UIColor {
        var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        
        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }
        
        if ((cString.characters.count) != 6) {
            return UIColor.gray
        }
        
        var rgbValue:UInt32 = 0
        Scanner(string: cString).scanHexInt32(&rgbValue)
        
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
    
    func simpleAlert(titulo:String, texto: String)-> UIAlertController{
        let a = UIAlertController(title: titulo, message: texto, preferredStyle: .alert)
        a.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        return a
    }
}

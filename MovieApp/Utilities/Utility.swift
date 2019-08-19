//
//  File.swift
//  MovieApp
//
//  Created by Kashee ram on 8/18/19.
//  Copyright © 2019 Kashee ram. All rights reserved.
//

import UIKit


struct Colors {
    static let cardViewBGR = UIColor(red: 255.0 / 255.0, green: 255.0 / 255.0, blue: 255.0 / 255.0, alpha: 1.0)
    static let cardCellBGR = UIColor(red: 10/255, green: 178/255, blue: 230/255, alpha: 0.0)
    
    static let headerRGB = UIColor(red: 33.0/255, green: 73.0/255, blue: 88.0/255, alpha: 1)
    
    static let titleRGB = UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 0.60)
}


extension UIFont {
    class func sfDisplaySemibold(ofSize size: CGFloat) -> UIFont {
        return UIFont.systemFont(ofSize: size, weight: UIFont.Weight.semibold)
    }
    
    class func sfDisplayMedium(ofSize size: CGFloat) -> UIFont {
        return UIFont.systemFont(ofSize: size, weight: UIFont.Weight.medium)
    }
    
    class func sfDisplayBold(ofSize size: CGFloat) -> UIFont {
        return UIFont.systemFont(ofSize: size, weight: UIFont.Weight.bold)
    }
    
    class func sfDisplayLight(ofSize size: CGFloat) -> UIFont {
        return UIFont.systemFont(ofSize: size, weight: UIFont.Weight.light)
    }
    
    class func sfDisplayRegular(ofSize size: CGFloat) -> UIFont {
        return UIFont.systemFont(ofSize: size, weight: UIFont.Weight.regular)
    }
    
    class func sfDisplayItalic(ofSize size: CGFloat) -> UIFont {
        return UIFont.italicSystemFont(ofSize: size)
        //        return UIFont.systemFont(ofSize: size, weight: UIFontWeightI)
    }
}



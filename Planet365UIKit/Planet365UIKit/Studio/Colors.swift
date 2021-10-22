//
//  Colors.swift
//  Planet365UIKit
//
//  Created by Vladimir Lukic on 18.10.21..
//

import UIKit

// Colors
struct Color {
    
    // Background
    static let backgroundWhite = UIColor.init(netHex: 0xFFFFFF)
    static let backgroundBlack = UIColor.init(netHex: 0x23262A)
    static let backgroundGreyDark = UIColor.init(netHex: 0x3B3E44)
    static let backgroundGreyLight = UIColor.init(netHex: 0x55585D)
    static let backgroundYellow = UIColor.init(netHex: 0xDF3BC41)
    static let backgroundYellowSelected = UIColor.init(netHex: 0xEFB944)
    static let backgroundGreen = UIColor.init(netHex: 0x71B551)
    
    // Foreground
    static let foregroundWhite = UIColor.init(netHex: 0xF6F6F7)
    static let foregroundBlack = UIColor.init(netHex: 0x253540)
    static let foregroundGrey = UIColor.init(netHex: 0x848587)
    static let foregroundGreyAlt = UIColor.init(netHex: 0xADAEB0)
    static let foregroundGreyLight = UIColor.init(netHex: 0xBABDC4)
    static let foregroundYellow = UIColor.init(netHex: 0xEFCB4D)
    static let foregroundBlue = UIColor.init(netHex: 0xA8C1D3)
    static let foregroundGreen = UIColor.init(netHex: 0x9BC989)
    
    // Icon
    static let iconBlack = UIColor.init(netHex: 0x000000)
}

// MARK: - UIColor Extensions
// MARK:

// Extension for UIColor
extension UIColor {
    
    // Set color using RGB params
    convenience init(red: Int, green: Int, blue: Int, alphaFloat: CGFloat) {
        assert(red   >= 0 && red   <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue  >= 0 && blue  <= 255, "Invalid blue component")
        
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: alphaFloat)
    }
    
    // Set color as 0xff88ro
    convenience init(netHex:Int) {
        self.init(red:(netHex >> 16) & 0xff, green:(netHex >> 8) & 0xff, blue:netHex & 0xff, alphaFloat: 1.0)
    }
    
    // Set color as 0xff88ro
    convenience init(netHex:Int, alpha: CGFloat) {
        self.init(red:(netHex >> 16) & 0xff, green:(netHex >> 8) & 0xff, blue:netHex & 0xff, alphaFloat: alpha)
    
    }
}

//
//  Constants.swift
//  Lemonde Stand
//
//  Created by Wale Anif on 11/12/14.
//  Copyright (c) 2014 Lavvo Group. All rights reserved.
//

import Foundation
import UIKit

struct Constants {
    
    static let FONT_01: String = "Helvetica Neue"
    static let FONT_02: String = "Lucida Grande"
    
    static let COLOR_YELLOW: Int = 0xFEFF97
    static let COLOR_ORANGE: Int = 0xFF6B09
    static let COLOR_DARKGRAY: Int = 0x555555
    static let COLOR_LIGHTGRAY: Int = 0xB6B6B6
    static let COLOR_STROKE: Int = 0xE7E7E7
    
    static let PADDING: CGFloat = 10.0
    
    static let ONE_THIRD: CGFloat = 1.0/3.0
    static let HALF: CGFloat = 1.0/2.0
    static let QUARTER: CGFloat = 1.0/4.0
    static let ONE_SIXTH: CGFloat = 1.0/6.0
    static let ONE_EIGHTH: CGFloat = 1.0/8.0
    static let ONE_TENTH: CGFloat = 1.0/10.0
    
    static let PERCENT_10: CGFloat = 0.1
    static let PERCENT_15: CGFloat = 0.15
    static let PERCENT_20: CGFloat = 0.2
    static let PERCENT_30: CGFloat = 0.3
    static let PERCENT_40: CGFloat = 0.4
    static let PERCENT_50: CGFloat = 0.5
    static let PERCENT_80: CGFloat = 0.8
    
    static let RESOLUTION_AT_2X: CGFloat = 2.0
    static let RESOLUTION_AT_3X: CGFloat = 3.0
    
    static let IPHONE_4_WIDTH: CGFloat = 320.0
    static let IPHONE_4_HEIGHT: CGFloat = 480.0
    static let IPHONE_4_PIXELS = (width: IPHONE_4_WIDTH * RESOLUTION_AT_2X, height: IPHONE_4_HEIGHT * RESOLUTION_AT_2X)
    
    static let IPHONE_5_WIDTH: CGFloat = 320.0
    static let IPHONE_5_HEIGHT: CGFloat = 568.0
    static let IPHONE_5_PIXELS = (width: IPHONE_5_WIDTH * RESOLUTION_AT_2X, height: IPHONE_5_HEIGHT * RESOLUTION_AT_2X)
    
    static let IPHONE_6_WIDTH: CGFloat = 375.0
    static let IPHONE_6_HEIGHT: CGFloat = 667.0
    static let IPHONE_6_PIXELS = (width: IPHONE_6_WIDTH * RESOLUTION_AT_2X, height: IPHONE_6_HEIGHT * RESOLUTION_AT_2X)
    
    static let IPHONE_6PLUS_WIDTH: CGFloat = 414.0
    static let IPHONE_6PLUS_HEIGHT: CGFloat = 736.0
    static let IPHONE_6PLUS_PIXELS = (width: IPHONE_6PLUS_WIDTH * RESOLUTION_AT_3X, height: IPHONE_6PLUS_HEIGHT * RESOLUTION_AT_3X)
}

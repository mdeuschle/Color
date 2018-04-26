//
//  Color.swift
//  Color
//
//  Created by Matt Deuschle on 4/25/18.
//  Copyright © 2018 Matt Deuschle. All rights reserved.
//

import UIKit

struct Color: Codable {
    let title: String
    let rank: Int
    let rgb: RGB
}

struct RGB: Codable {
    let red: CGFloat
    let green: CGFloat
    let blue: CGFloat
}




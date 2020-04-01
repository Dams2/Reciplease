//
//  TimeFormatter.swift
//  Reciplease
//
//  Created by Damien Rojo on 01.04.20.
//  Copyright © 2020 Damien Rojo. All rights reserved.
//

import Foundation

final class TimeFormatter {
    
    class func hourOrMinuteFormat(time: Int) -> String {
        if time >= 60 {
            return "\(time / 60)h"
        } else {
            return "\(time)m"
        }
    }
}

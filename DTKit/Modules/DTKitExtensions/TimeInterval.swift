//
//  TimeInterval.swift
//  DTKit
//
//  Created by Thorn, David on 14.05.20.
//  Copyright © 2020 David Thorn. All rights reserved.
//

import UIKit

// MARK: - Extension - TimeInterval convertToMinute -

public extension TimeInterval {

    /// an eigth of a second
    var eigth: TimeInterval {
        1 / 8
    }

    /// a quarter of a second
    var quarter: TimeInterval {
        1 / 4
    }

    /// Total seconds in a minute, duh!
    var secondsInMinute: TimeInterval {
        60
    }

    /// Converts a time interval to hours and minutes.
    /// - Returns: A tuple containing the hours and minutes within this time interval
    func convertToTime() -> (hours: Int, minutes: Int) {
        let remaining = remainder(dividingBy: quarter)
        var totaltime = self - remaining

        if remaining >= eigth {
            totaltime += quarter
        }

        let minutesDecimal = totaltime - Double(Int(totaltime))
        let minutes = Int(secondsInMinute * minutesDecimal)
        return (hours: Int(totaltime) , minutes: minutes)
    }

}

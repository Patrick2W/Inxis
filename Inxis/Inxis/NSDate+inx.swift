//
//  NSDate+inx.swift
//  Inxis
//
//  Created by cheyun on 2019/11/4.
//  Copyright © 2019 ixxxxx.com. All rights reserved.
//

import Foundation


public extension Assistant where Target: NSDate {
    
    var year: Int { return Calendar.current.component(.year, from: target as Date) }
    var month: Int { return Calendar.current.component(.month, from: target as Date)}
    var day: Int { return Calendar.current.component(.day, from: target as Date) }
    var hour: Int { return Calendar.current.component(.hour, from: target as Date) }
    var minute: Int { return Calendar.current.component(.minute, from: target as Date) }
    var secend: Int { return Calendar.current.component(.second, from: target as Date) }
    var weekDay: Int { return Calendar.current.component(.weekday, from: target as Date) }
    var weekdayOrdinal: Int { return Calendar.current.component(.weekdayOrdinal, from: target as Date) }
    var weekOfMonth: Int { return Calendar.current.component(.weekOfMonth, from: target as Date) }
    var weekOfYear: Int { return Calendar.current.component(.weekOfYear, from: target as Date) }
    /*
    func date(byAddingDay day:Int) -> NSDate {
        
    }
 */
}

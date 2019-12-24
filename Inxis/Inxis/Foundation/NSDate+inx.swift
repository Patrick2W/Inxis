//
//  NSDate+inx.swift
//  Inxis
//
//  Created by cheyun on 2019/11/4.
//  Copyright © 2019 ixxxxx.com. All rights reserved.
//

import Foundation


public extension Assistant where Target: NSDate {
    
    private var calendar: Calendar { return Calendar.current }
    
    var yesterday: NSDate { return target.inx.date(byAdding: -1)! as NSDate }
    var tomorrow: NSDate { return target.inx.date(byAdding: 1)! as NSDate }
    
    var year: Int { return calendar.component(.year, from: target as Date) }
    var month: Int { return calendar.component(.month, from: target as Date)}
    var day: Int { return calendar.component(.day, from: target as Date) }
    var hour: Int { return calendar.component(.hour, from: target as Date) }
    var minute: Int { return calendar.component(.minute, from: target as Date) }
    var secend: Int { return calendar.component(.second, from: target as Date) }
    var weekDay: Int { return calendar.component(.weekday, from: target as Date) }
    var weekdayOrdinal: Int { return calendar.component(.weekdayOrdinal, from: target as Date) }
    var weekOfMonth: Int { return calendar.component(.weekOfMonth, from: target as Date) }
    var weekOfYear: Int { return calendar.component(.weekOfYear, from: target as Date) }
    
    var isLeapMonth: Bool { return calendar.dateComponents([.quarter], from: target as Date).isLeapMonth ?? false }
    var isLeapYear: Bool {
        let y = year
        return y % 400 == 0 || (y % 100 != 0 && y % 4 == 0)
    }
    
    var isToday: Bool {
        if fabs(target.timeIntervalSinceNow) >= 3600 * 24 { return false }
        return NSDate().inx.day == day
    }
    
    var isYesterday: Bool { return tomorrow.inx.isToday }
    var isTomorrow: Bool { return yesterday.inx.isToday }
    
    var firstDayOfMonth: Date? { return date(byAdding: -day + 1) }
    var endDayOfMonth: Date? { return date(byAdding: -day, months: 1) }
    
    func date(byAdding days: Int = 0, months: Int = 0, years: Int = 0) -> Date? {
        var components = DateComponents()
        components.day = days
        components.month = months
        components.year = years
        return calendar.date(byAdding: components, to: target as Date)
    }
    
    func date(byAdding hours: Int = 0, minutes: Int = 0, secends: Int = 0) -> NSDate {
        var timeInterval = target.timeIntervalSinceReferenceDate
        timeInterval += Double(hours * 3600)
        timeInterval += Double(minutes * 60)
        timeInterval += Double(secends)
        return NSDate(timeIntervalSinceReferenceDate: timeInterval)
    }
    
    func toString(_ formart: String,
                  timeZone: TimeZone = TimeZone.current,
                  locale: Locale = Locale.current) -> String {
        let dateFormart = DateFormatter()
        dateFormart.dateFormat = formart
        dateFormart.timeZone = timeZone
        dateFormart.locale = locale
        return dateFormart.string(from: target as Date)
    }
    
    static func date(with year: Int, month: Int, day: Int, hour: Int = 0, minute: Int = 0, secend: Int = 0) -> Date? {
        var components = DateComponents()
        components.second = secend
        components.minute = minute
        components.hour = hour
        components.day = day
        components.month = month
        components.year = year
        return Calendar.current.date(from: components)
    }
    
    static func toDate(_ dateString: String,
                       formart: String,
                       timeZone: TimeZone? = nil,
                       locale: Locale? = nil) -> Date? {
        let dateFormart = DateFormatter()
        dateFormart.dateFormat = formart
        if let tz = timeZone { dateFormart.timeZone = tz }
        if let lc = locale { dateFormart.locale = lc }
        return dateFormart.date(from: dateString)
    }
}



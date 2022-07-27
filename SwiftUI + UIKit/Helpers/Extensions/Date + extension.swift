//
//  Date + extension.swift
//  City Guide
//
//  Created by Omega on 27.07.2022.
//

import Foundation

public extension Date {

    init?(string: String, format: String) {
        let dateFormatter = DateFormatter()
        dateFormatter.calendar = .init(identifier: .gregorian)
        dateFormatter.dateFormat = format
        dateFormatter.locale = Locale(identifier: "en-US")
        guard let date = dateFormatter.date(from: string) else {
            return nil
        }
        self = date
    }

    func formatted(_ format: String) -> String {
        let dataFormatter = DateFormatter()
        dataFormatter.dateFormat = format
        dataFormatter.locale = Locale(identifier: "ru-Ru")
        return dataFormatter.string(from: self)
    }

    func formatDayMonthYearPoint() -> String {
        formatted("dd.MM.yyyy")
    }

    func formatUTC() -> String {
        formatted("yyyy-MM-dd'T'HH:mm:ss.SSSZ")
    }
}

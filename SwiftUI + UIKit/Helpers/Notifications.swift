//
//  Notifications.swift
//  City Guide
//
//  Created by Omega on 27.06.2022.
//

import Foundation

public func addNotificationObserver(name: Notification.Name, using block: @escaping (Notification) -> Void) {
  NotificationCenter.default.addObserver(forName: name, object: nil, queue: .main, using: block)
}

public func postNotification(_ name: Notification.Name, object: AnyObject? = nil, userInfo: [AnyHashable: Any]? = nil) {
  NotificationCenter.default.post(name: name, object: object, userInfo: userInfo)
}

public func removeNotificationObserver(_ observer: AnyObject, name: Notification.Name? = nil, object: AnyObject? = nil) {
  NotificationCenter.default.removeObserver(observer, name: name, object: object)
}

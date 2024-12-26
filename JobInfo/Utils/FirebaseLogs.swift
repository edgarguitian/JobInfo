//
//  FirebaseLogs.swift
//  JobInfo
//
//  Created by Edgar Guitian Rey on 19/12/24.
//

import FirebaseCrashlytics
let firebaseLogs = FirebaseLogs()

class FirebaseLogs: NSObject, @unchecked Sendable {
    func sendRecord(message: String, description: String) {
        let exceptionModel = ExceptionModel(name: message, reason: description)
        Crashlytics.crashlytics().record(exceptionModel: exceptionModel)
    }

    func setCustomValue(_ value: String, forKey: String) {
        Crashlytics.crashlytics().setCustomValue(value, forKey: forKey)
    }

    func setUserID(_ id: String) {
        Crashlytics.crashlytics().setUserID(id)
    }
}


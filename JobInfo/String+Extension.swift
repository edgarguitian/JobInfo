//
//  String+Extension.swift
//  JobInfo
//
//  Created by Edgar Guitian Rey on 23/12/24.
//

import Foundation

extension String {
    /// Decodes a UTF-8 encoded string
    var utf8Decoded: String {
        guard let data = self.data(using: .isoLatin1),
              let decodedString = String(data: data, encoding: .utf8) else {
            return self
        }
        return decodedString
    }
}

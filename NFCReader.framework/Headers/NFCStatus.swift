//
//  NFCError.swift
//  NFCReader
//
//  Created by 开发 on 2025/9/23.
//

public enum NFCStatus: String {
    case duplicate = "-1"
    case notSupported = "-2"
    case notAvailable = "-3"
    case aidLengthError = "-4"
    case versionError = "-5"
    case passwordNotSet = "-6"
    case unknown = "-999"
}

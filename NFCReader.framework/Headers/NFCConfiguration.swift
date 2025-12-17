//
//  NFCConfiguration.swift
//  NFCReader
//
//  Created by 开发 on 2025/9/23.
//

public struct NFCConfig {
    
    //nfc
    public var startScanning: String?
    public var duplicate: String?
    public var notSupported: String?
    
    //loading
    public var loading: String?
    public var success: String?
    public var failure: String?
    public var empty: String?
    
    //password
    public var passwordCount: String?
    public var passwordBanned: String?
    
    //version
    public var lowVersion: String?
    
    //other
    public var same: String?
    public var exceed: String?
    
    public init(startScanning: String? = nil,
                duplicate: String? = nil,
                notSupported: String? = nil,
                passwordCount: String? = nil,
                passwordBanned: String? = nil,
                lowVersion: String? = nil,
                loading: String? = nil,
                success: String? = nil,
                empty: String? = nil,
                same: String? = nil,
                exceed: String? = nil,
                failure: String? = nil) {
        self.startScanning = startScanning
        self.duplicate = duplicate
        self.notSupported = notSupported
        self.passwordCount = passwordCount
        self.passwordBanned = passwordBanned
        self.lowVersion = lowVersion
        self.loading = loading
        self.success = success
        self.empty = empty
        self.failure = failure
        self.same = same
        self.exceed = exceed
    }
}




import Foundation
import CoreNFC

public class NFCAnyBitReader: NSObject, NFCReaderProtocol {
    var iso7816Session: NFCTagReaderSession?
    var callback: Callback?
    var arguments: [String: Any]?
    var method: String?
    var xnfcTag: NFCISO7816Tag?
    
    var config: NFCConfig?
    
    public func getCardInfo(config: NFCConfig?, callback: @escaping Callback) {
        internal_getCardInfo(config: config, callback: callback)
    }
    
    public func writePassword(password: String, config: NFCConfig?, callback: @escaping Callback) {
        internal_writePassword(password: password, config: config, callback: callback)
    }
    
    public func verifyPassword(password: String, config: NFCConfig?, callback: @escaping Callback) {
        internal_verifyPassword(password: password, config: config, callback: callback)
    }
    
    public func changePassword(oldPassword: String, newPassword: String, config: NFCConfig?, callback: @escaping Callback) {
        internal_changePassword(oldPassword: oldPassword, newPassword: newPassword, config: config, callback: callback)
    }
    
    public func readSeed(password: String, isOnlyRead: Bool, seed: String, config: NFCConfig?, callback: @escaping Callback) {
        internal_readSeed(password: password, isOnlyRead: isOnlyRead, seed: seed, config: config, callback: callback)
    }
    
    public func writeSeed(password: String, seed: String, config: NFCConfig?, callback: @escaping Callback) {
        internal_writeSeed(password: password, seed: seed, config: config, callback: callback)
    }
    
    public func initCard(version: String, password: String, initStr: String, config: NFCConfig?, callback: @escaping Callback) {
        internal_initCard(version: version, password: password, initStr: initStr, config: config, callback: callback)
    }
    
    public func updateMessage(message: String, needInvalidate: Bool) {
        internal_updateMessage(message: message, needInvalidate: needInvalidate)
    }
    
    public func transferBTC(password: String, config: NFCConfig?, callback: @escaping Callback) {
        internal_transferBTC(password: password, config: config, callback: callback)
    }
    
    public func signBTC(command: String, password: String, callback: @escaping Callback) {
        internal_signBTC(command: command, password: password, callback: callback)
    }
    
    public func transferTRX(version: String, password: String, hashStr: String, config: NFCConfig?, callback: @escaping Callback) {
        internal_transferTRX(version: version, password: password, hashStr: hashStr, config: config, callback: callback)
    }
    
    public func transferEVM(version: String, password: String, hashStr: String, config: NFCConfig?, callback: @escaping Callback) {
        internal_transferEVM(version: version, password: password, hashStr: hashStr, config: config, callback: callback)
    }
    
    public func read2FA(password: String, config: NFCConfig?, callback: @escaping Callback) {
        internal_read2FA(password: password, config: config, callback: callback)
    }
    
    public func continuouslyFetch2FACode(message: String, command: String, isDone: Bool, callback: @escaping Callback) {
        internal_continuouslyFetch2FACode(message: message, command: command, isDone: isDone, callback: callback)
    }
    
    public func write2FA(password: String, hashStr: String, config: NFCConfig?, callback: @escaping Callback) {
        internal_write2FA(password: password, hashStr: hashStr, config: config, callback: callback)
    }
    
    public func delete2FA(password: String, hashStr: String, config: NFCConfig?, callback: @escaping Callback) {
        internal_delete2FA(password: password, hashStr: hashStr, config: config, callback: callback)
    }
    
    func startSession(callback: @escaping (String) -> Void) {
        guard NFCTagReaderSession.readingAvailable else {
            callback(NFCStatus.notAvailable.rawValue)
            return
        }
        
        iso7816Session = NFCTagReaderSession(pollingOption: [.iso14443, .iso15693, .iso18092],
                                             delegate: self,
                                             queue: nil)
        iso7816Session?.alertMessage = config?.startScanning ?? ""
        iso7816Session?.begin()
    }
}

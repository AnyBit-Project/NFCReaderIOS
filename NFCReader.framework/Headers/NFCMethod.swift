//
//  NFCMethod.swift
//  NFCReader
//
//  Created by 开发 on 2025/9/23.
//

public struct NFCMethod {
    static let cardInfo = "anybit_card_info"
    static let writePassword = "anybit_write_password"
    static let changePassword = "anybit_change_password"
    static let verifyPassword = "anybit_verify_password"
    static let initCard = "anybit_init_card"
    static let writeSeed = "anybit_write_seed"
    static let readSeed = "anybit_read_seed"
    static let transferTRX = "anybit_transfer_trx"
    static let transferBTC = "anybit_transfer_btc"
    static let transferEVM = "anybit_transfer_evm"
    static let signBTC = "anybit_sign_btc"
    static let read2FA = "anybit_read_2fa"
    static let write2FA = "anybit_write_2fa"
    static let delete2FA = "anybit_delete_2fa"
    
    static let boeWriteMethod = "X_METHOD_BOE_WRITE_IMAGE_KEY"
    static let boeSetupMethod = "X_METHOD_BOE_SET_UP_KEY"
    static let boeProgressMethod = "X_METHOD_BOE_PROGRESS_KEY"
}



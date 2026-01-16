# NFCReader

## 1.Get Device Information
`func getCardInfo(config: NFCConfig?, callback: @escaping Callback`

Success return：aid#serial#publicKey<br>
Uninitialized return：aid#serial#6D05<br>

## 2.Initialize Device
`func initCard(version: String, password: String, initStr: String, config: NFCConfig?, callback: @escaping Callback`


version：Version（01，02，03，...）<br>
password: Device password (6-digit number)<br>
initStr: privateKeyHex + publicKeyHex + crc8Hex(privateKeyHex + publicKeyHex)<br>

Success return：aid#serial#publicKey<br>

## 3.Verify Password
`func verifyPassword(password: String, config: NFCConfig?, callback: @escaping Callback`

password: Device password (6-digit number)<br>
Success return：9A00<br>

## 4.Write Password
`func writePassword(password: String, config: NFCConfig?, callback: @escaping Callback`

password: Device password (6-digit number)<br>
Success return：9A00<br>

## 5.Change Password
`func changePassword(oldPassword: String, newPassword: String, config: NFCConfig?, callback: @escaping Callback`

oldPassword: Device password (6-digit number)<br>
newPassword: New password (6-digit number)<br>
Success return：9A00<br>

## 6.Update iOS System Pop-up Information
`func updateMessage(message: String, needInvalidate: Bool)`

No return value<br>

## 7.Strat Send BTC
`func transferBTC(password: String, config: NFCConfig? = nil, callback: @escaping Callback`

password: Device password (6-digit number)<br>
Success return：9A00<br>

## 8.Sign BTC (Sign a single input of BTC)
`func signBTC(command: String, password: String, callback: @escaping Callback`

command: single input transaction hex([0x80, 0x80, 0x04, 0x00, hashLength, 0x02, hashData])<br>
password: Device password (6-digit number)<br>
Success return：xxxxxxxx9A00<br>

## 9.Get Signature rs of TRX Transaction
`func transferTRX(version: String, password: String, hashStr: String, config: NFCConfig?, callback: @escaping Callback`

version：Version（01，02，03，...）<br>
password: Device password (6-digit number)<br>
hashStr: Transaction hash string<br>

Success return：rs string - the first 6 characters have no practical use; characters 6-7 are a hexadecimal number (its value ×2 is the character length of r segment (leftLen)), the r segment starts at character 8; after the r segment, the hexadecimal number from position 10+leftLen to 12+leftLen (its value ×2 is the character length of s segment) determines the length of s segment, and the s segment starts at position 12+leftLen<br>

## 10.Get Signature rs of EVM Transaction
`func transferEVM(version: String, password: String, hashStr: String, config: NFCConfig?, callback: @escaping Callback`

version：Version（01，02，03，...）<br>
password: Device password (6-digit number)<br>
hashStr: Transaction hash string<br>

Success return：rs string - the first 6 characters have no practical use; characters 6-7 are a hexadecimal number (its value ×2 is the character length of r segment (leftLen)), the r segment starts at character 8; after the r segment, the hexadecimal number from position 10+leftLen to 12+leftLen (its value ×2 is the character length of s segment) determines the length of s segment, and the s segment starts at position 12+leftLen<br>

## 11.Read Mnemonic Phrase
`func readSeed(password: String, isOnlyRead: Bool, seed: String, config: NFCConfig?, callback: @escaping Callback`

password: Device password (6-digit number)<br>
isOnlyRead: Whether it is read-only; if not, writing will be performed when the read result is empty<br>
seed：Mnemonic phrase to be written<br>
Success return：9A00<br>

## 12.Write Mnemonic Phrase
`func writeSeed(password: String, seed: String, config: NFCConfig? = nil, callback: @escaping Callback`

password: Device password (6-digit number)<br>
seed：Mnemonic phrase to be written<br>

Success return：9A00<br>

## 13.Read 2FA 
`func read2FA(password: String, config: NFCConfig?, callback: @escaping Callback)`

password: Device password (6-digit number)<br>

Success return：xxxxxxxx9A00 - The first two hexadecimal characters represent the length of the tag, followed by the ASCII value of the tag.
For example: 0170026F6F9A00
01 indicates that the first tag has a length of 1, and 70 represents the ASCII value of the tag 'p';
02 indicates that the second tag has a length of 2, and 6F6F represents the ASCII value of the second tag 'oo'.<br>

## 14.Write 2FA
`func write2FA(password: String, hashStr: String, config: NFCConfig?, callback: @escaping Callback)`

password: Device password (6-digit number)<br>
hashStr：name and private hex([(name.len + private.len).toBytes, nameBytes, privateBytes])<br>

Success return：xxxxxxxx9A00 - The first two hexadecimal characters represent the length of the tag, followed by the ASCII value of the tag.
For example: 0170026F6F9A00
01 indicates that the first tag has a length of 1, and 70 represents the ASCII value of the tag 'p';
02 indicates that the second tag has a length of 2, and 6F6F represents the ASCII value of the second tag 'oo'.<br> 

## 15.Continuously Fetch 2FA Code
`func continuouslyFetch2FACode(message: String, command: String, isDone: Bool, callback: @escaping Callback)`

message: update iOS system pop-up information<br>
command: tag length and tag hex(0170, 026F6F, ...)<br>
isDone：update iOS system pop-up status(true: invalidate)<br>

Success return：xxxxxxxx9A00 - When the NFC command completes successfully (Status Word 0x9A00), the preceding response data must be processed using the platform-provided 2FA derivation mechanism. The response data should be treated as an opaque value and must not be interpreted or transformed directly by the application. The derivation process produces a deterministic, numeric verification code that is always exactly six digits in length and left-padded with zeros if necessary. Applications should rely exclusively on the official SDK or utility method to obtain the final 2FA code.<br>

## 16.Delete 2FA
`func delete2FA(password: String, hashStr: String, config: NFCConfig?, callback: @escaping Callback)`

password: Device password (6-digit number)<br>
hashStr: tag length and tag hex(0170, 026F6F, ...)<br>

Success return：9A00<br>

## Error Code

- `-1` -- Multiple devices scanned at one time
- `-2` -- Unsupported device
- `-3` -- Device unavailable
- `-4` -- Incorrect aid length
- `-5` -- Version error
- `-6` -- Password not set
- `-7` -- No device detected
- `-999` -- Unknown error
- `9A00` -- Success
- `6D01` -- Initialization failed
- `6D05` -- Uninitialized
- `6D07` -- Incorrect password length
- `6D0C` -- Password verification failed
- `6D00` -- 10 consecutive verification failures, device locked
- `6DBB` -- 2FA tag name exist error
- `6DCC` -- Incorrect 2FA tag name length 

Note: When verifying the password, `6D0C` will be returned for the first error; subsequent failures will return `6D09`, `6D08`, `6D07`, ... , `6D00` in sequence

##  NFCConfig

Mainly used to display text information in the iOS NFC system pop-up
- `startScanning` -- Text for starting scanning
- `duplicate` -- Text for duplicate device
- `notSupported` -- Text for unsupported device
- `loading` -- Text for loading
- `success` -- Text for success
- `failure` -- Text for failure
- `empty` -- Text for empty mnemonic phrase read
- `passwordCount` -- Text for remaining password verification attempts
- `passwordBanned` -- Text for device banned
- `lowVersion` -- Text for low version error

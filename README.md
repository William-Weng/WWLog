# WWLog
[![Swift-5.7](https://img.shields.io/badge/Swift-5.7-orange.svg?style=flat)](https://developer.apple.com/swift/) [![iOS-15.0](https://img.shields.io/badge/iOS-15.0-pink.svg?style=flat)](https://developer.apple.com/swift/) ![](https://img.shields.io/github/v/tag/William-Weng/WWLog) [![Swift Package Manager-SUCCESS](https://img.shields.io/badge/Swift_Package_Manager-SUCCESS-blue.svg?style=flat)](https://developer.apple.com/swift/) [![LICENSE](https://img.shields.io/badge/LICENSE-MIT-yellow.svg?style=flat)](https://developer.apple.com/swift/)

### [Introduction - 簡介](https://swiftpackageindex.com/William-Weng)
- This is a good helper for iOS engineer Debug.
- 這是一個iOS工程師Debug的好幫手。

### [Installation with Swift Package Manager](https://medium.com/彼得潘的-swift-ios-app-開發問題解答集/使用-spm-安裝第三方套件-xcode-11-新功能-2c4ffcf85b4b)
```swift
dependencies: [
    .package(url: "https://github.com/William-Weng/WWLog.git", .upToNextMajor(from: "1.1.1"))
]
```

### Function - 可用函式
|函式|功能|
|-|-|
|configure(with:level:textColor:backgroundColor:)|設定一些初始值|
|log(_:)|印出Log文字|

### Example
```swift
import UIKit
import WWLog

final class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        WWLog.shared.configure(textColor: .white)
    }
    
    @IBAction func printLog(_ sender: UIBarButtonItem) {
        WWLog.shared.log("列印文字")
    }
}
```

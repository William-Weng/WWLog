//
//  LogWindow.swift
//  WWLog
//
//  Created by William.Weng on 2021/9/2.
//

import UIKit

// MARK: - LogWindow
public class LogWindow: UIWindow {
    
    /// [產生一個新的Window => Bundle.module](https://badrbujbara.medium.com/create-reusable-swift-package-modules-with-storyboards-be396e01793d)
    static func build() -> LogWindow {
        return LogWindow(frame: .zero)
    }
}

// MARK: - LogWindow (function)
public extension LogWindow {
    
    /// 設定一些初始值
    /// - Parameters:
    ///   - frame: 尺寸
    ///   - level: 等級
    ///   - textColor: 文字色
    ///   - backgroundColor: 背景色
    func configure(with frame: CGRect = CGRect(x: 100, y: 100, width: 200, height: 200), level: Int = 1000, textColor: UIColor, backgroundColor: UIColor = UIColor.black.withAlphaComponent(0.3)) {
        
        let viewController = UIStoryboard._instantiateViewController(name: "Main", bundle: .module) as LogViewController
        let level = UIWindow.Level.alert + UIWindow.Level.RawValue(level)
        
        self.frame = frame
        windowScene = UIWindowScene._current
        layer.cornerRadius = 8
        layer.masksToBounds = true
        
        _backgroundColor(.clear)
              ._windowLevel(level)
              ._rootViewController(viewController)
              ._makeKeyAndVisible()
                
        viewController.logTextView.text = ""
        viewController.logTextView.textColor = textColor
        viewController.logTextView.backgroundColor = backgroundColor
    }
    
    /// 印出Log文字
    /// - Parameter message: T
    func log<T>(_ message: T) {
        guard let viewController = rootViewController as? LogViewController else { return }
        viewController.log("\(message)")
    }
}

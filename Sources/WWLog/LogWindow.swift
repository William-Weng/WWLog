//
//  LogWindow.swift
//  WWLog
//
//  Created by William.Weng on 2021/9/2.
//

import UIKit

// MARK: - LogWindow
public class LogWindow: UIWindow {
    
    static var Frame = CGRect(x: 100, y: 100, width: 200, height: 200)
    static var Level = 1000
    static var BackgroundColor = UIColor.black.withAlphaComponent(0.3)

    /// [產生一個新的Window => Bundle.module](https://badrbujbara.medium.com/create-reusable-swift-package-modules-with-storyboards-be396e01793d)
    static func build() -> LogWindow {
        
        let window = LogWindow(frame: Self.Frame)
        let viewController = UIStoryboard._instantiateViewController(name: "Main", bundle: Bundle.module) as LogViewController
        let level = UIWindow.Level.alert + UIWindow.Level.RawValue(Self.Level)

        if #available(iOS 13.0, *) { window.windowScene = UIWindowScene._current }
        
        window._backgroundColor(.clear)
              ._windowLevel(level)
              ._rootViewController(viewController)
              ._makeKeyAndVisible()
        
        viewController.logTextView.text = ""
        viewController.logTextView.backgroundColor = Self.BackgroundColor
        
        return window
    }
    
    /// 設定一些初始值
    /// - Parameters:
    ///   - frame: CGRect
    ///   - level: Int
    ///   - backgroundColor: UIColor
    static func configure(with frame: CGRect = CGRect(x: 100, y: 100, width: 200, height: 200), level: Int = 1000, backgroundColor: UIColor = UIColor.black.withAlphaComponent(0.3)) {
        Self.Frame = frame
        Self.Level = level
        Self.BackgroundColor = backgroundColor
    }
}

// MARK: - LogWindow (function)
public extension LogWindow {
    
    /// 印出Log文字
    /// - Parameter message: T
    func log<T>(_ message: T) {
        guard let viewController = self.rootViewController as? LogViewController else { return }
        viewController.log("\(message)")
    }
}

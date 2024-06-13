//
//  Extension.swift
//  WWLog
//
//  Created by William.Weng on 2021/9/2.
//

import UIKit

// MARK: - UIStoryboard (static function)
extension UIStoryboard {
    
    /// 由UIStoryboard => ViewController
    /// - Parameters:
    ///   - name: Storyboard的名稱 => Main.storyboard
    ///   - storyboardBundleOrNil: Bundle名稱
    ///   - identifier: ViewController的代號 (記得要寫)
    /// - Returns: T (泛型) => UIViewController
    static func _instantiateViewController<T: UIViewController>(name: String = "Main", bundle storyboardBundleOrNil: Bundle? = nil, identifier: String = String(describing: T.self)) -> T {
        
        let viewController: T
        
        if #available(iOS 13.0, *) {
            viewController = Self(name: name, bundle: storyboardBundleOrNil).instantiateViewController(identifier: identifier) as T
        } else {
            viewController = Self(name: name, bundle: storyboardBundleOrNil).instantiateViewController(withIdentifier: identifier) as! T
        }
        
        return viewController
    }
}

// MARK: - UIWindow (function)
extension UIWindow {
    
    func _backgroundColor(_ color: UIColor?) -> Self {
        self.backgroundColor = color
        return self
    }
    
    func _windowLevel(_ level: UIWindow.Level) -> Self {
        self.windowLevel = level
        return self
    }
    
    func _rootViewController(_ rootViewController: UIViewController?) -> Self {
        self.rootViewController = rootViewController
        return self
    }
    
    func _makeKeyAndVisible() {
        self.makeKeyAndVisible()
    }
}

// MARK: - UIWindowScene (static function)
@available(iOS 13.0, *)
extension UIWindowScene {
    
    static var _current: UIWindowScene? { return UIApplication.shared.connectedScenes.first as? UIWindowScene }
}

// MARK: - UIPasteboard (static function)
extension UIPasteboard {
 
    /// 快速Copy到剪貼簿上 + 震動提示 (全域)
    /// - Parameter string: 要複製的文字
    static func _paste(string: String) {
        
        let feedBackGenertor = UINotificationFeedbackGenerator()
        let pasteboard = UIPasteboard.general
        
        pasteboard.string = string
        feedBackGenertor.notificationOccurred(.success)
    }
}

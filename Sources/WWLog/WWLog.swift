//
//  WWLog.swift
//  WWLog
//
//  Created by William.Weng on 2021/9/3.
//

import UIKit

// MARK: - WWLog
open class WWLog {
    public static let shared = LogWindow.build()
}

// MARK - WWLog (class)
extension WWLog {
    
    /// 設定一些初始值
    /// - Parameters:
    ///   - frame: 外形大小
    ///   - level: 最上層的等級
    ///   - backgroundColor: 背景顏色
    public static func configure(with frame: CGRect = CGRect(x: 100, y: 100, width: 200, height: 200), level: Int = 1000, backgroundColor: UIColor = UIColor.black.withAlphaComponent(0.3)) {
        LogWindow.configure(with: frame, level: level)
    }
}

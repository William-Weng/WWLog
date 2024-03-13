//
//  LogViewController.swift
//  WWLog
//
//  Created by William.Weng on 2021/9/2.
//

import UIKit
import WWPrint

// MARK: - 主體
class LogViewController: UIViewController {

    @IBOutlet var dragView: UIView!
    @IBOutlet weak var logTextView: UITextView!
    @IBOutlet weak var zoomView: UIImageView!
    @IBOutlet weak var clearView: UIImageView!
    
    private let miniumSize = CGSize(width: 100, height: 100)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initGestureRecognizer()
    }
}

// MARK: - 公開的函數
extension LogViewController {
    
    /// 顯示Log (會自動往下移動)
    /// - Parameter message: String
    /// - Parameter level: LogWindow.LogLevel
    func log(_ message: String, level: LogWindow.LogLevel = .general) {
        
        let log: String
        
        switch level {
        case .general: log = message
        case .detail: log = wwMessage(message)
        }
        
        DispatchQueue.main.async {
            self.logTextView.text += "\(log)\n"
            self.updateTextViewScrollRange()
        }
    }
}

// MARK: - @objc
extension LogViewController {
    
    /// 清除文字內容
    /// - Parameter tap: UITapGestureRecognizer
    @objc func handleClear(_ tap: UITapGestureRecognizer) {
        DispatchQueue.main.async { self.logTextView.text = "" }
    }
    
    /// 移動Window (歸零)
    /// - Parameter pan: UIPanGestureRecognizer
    @objc func handleDrag(_ pan: UIPanGestureRecognizer) {
        
        guard let currentWindow = view.window else { return }
        
        let panLocation = pan.translation(in: pan.view)
        let center = currentWindow.center
        
        currentWindow.center = CGPoint(x: center.x + panLocation.x, y: center.y + panLocation.y)
        pan.setTranslation(.zero, in: pan.view)
    }
    
    /// 放大Window (歸零)
    /// - Parameter pan: UIPanGestureRecognizer
    @objc func handleZoom(_ pan: UIPanGestureRecognizer) {
                
        guard let currentWindow = view.window else { return }
        
        let panLocation = pan.translation(in: pan.view)
        let frame = currentWindow.frame
        let newFrame = CGRect(origin: frame.origin, size: zoomSize(with: frame, panLocation: panLocation))
        
        currentWindow.frame = newFrame
        pan.setTranslation(.zero, in: pan.view)
    }
}

// MARK: - 小工具
private extension LogViewController {
    
    /// 初始化GestureRecognizer
    func initGestureRecognizer() {
        
        let dragPan = UIPanGestureRecognizer(target: self, action: #selector(handleDrag(_:)))
        let movePan = UIPanGestureRecognizer(target: self, action: #selector(handleZoom(_:)))
        let clearTap = UITapGestureRecognizer(target: self, action: #selector(handleClear(_:)))

        dragView.addGestureRecognizer(dragPan)
        zoomView.addGestureRecognizer(movePan)
        clearView.addGestureRecognizer(clearTap)
    }
    
    /// 計算放大的Size
    /// - Parameters:
    ///   - frame: CGRect
    ///   - panLocation: CGPoint
    /// - Returns: CGSize
    func zoomSize(with frame: CGRect, panLocation: CGPoint) -> CGSize {
        
        let nowSize = CGSize(width: frame.size.width + panLocation.x, height: frame.size.height + panLocation.y)
        return CGSize(width: max(nowSize.width, miniumSize.width), height: max(nowSize.height, miniumSize.height))
    }
    
    /// UITextView自動向下移動
    func updateTextViewScrollRange() {
        
        let count = logTextView.text.count
        guard count > 0 else { return }
        
        let bottom = NSMakeRange(count - 1, 1)
        logTextView.scrollRangeToVisible(bottom)
    }
}

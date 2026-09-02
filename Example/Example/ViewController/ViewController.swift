//
//  ViewController.swift
//  Example
//
//  Created by William.Weng on 2026/9/2.
//

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

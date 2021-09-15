//
//  ViewController.swift
//  Example
//
//  Created by William.Weng on 2021/9/15.
//

import UIKit
import WWLog

final class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        _ = WWLog.shared
    }
    
    @IBAction func generalLog(_ sender: UIBarButtonItem) {
        WWLog.shared.log("高手專用")
    }
    
    @IBAction func detailLog(_ sender: UIBarButtonItem) {
        WWLog.shared.log("高高手專用", level: .detail)
    }
}


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
    
    @IBAction func printLog(_ sender: UIBarButtonItem) {
        WWLog.shared.log("列印文字")
    }
}


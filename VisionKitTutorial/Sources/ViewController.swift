//
//  ViewController.swift
//  VisionKitTutorial
//
//  Created by 佐藤真 on 2022/06/15.
//

import SnapKit
import UIKit

class ViewController: UIViewController {
    private let startScanLabel: UILabel = {
        let label = UILabel()
        label.text = L10n.startToScan
        label.layer.borderWidth = 1.0
        label.layer.borderColor = UIColor.blue.cgColor
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(startScanLabel)
        startScanLabel.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
    }
}

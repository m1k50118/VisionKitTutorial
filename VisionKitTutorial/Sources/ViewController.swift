//
//  ViewController.swift
//  VisionKitTutorial
//
//  Created by 佐藤真 on 2022/06/15.
//

import SnapKit
import UIKit
import VisionKit

class ViewController: UIViewController {
    private let startView = StartView()
    private var isDeviceCapacity = false

    init() {
        super.init(nibName: nil, bundle: nil)
        isDeviceCapacity = DataScannerViewController.isSupported && DataScannerViewController.isAvailable
    }

    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func loadView() {
        view = startView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        startView.startScanButton.addTarget(self, action: #selector(tappedStartScanButton), for: .touchUpInside)
    }

    @objc func tappedStartScanButton() {
        isDeviceCapacity ? presentNextViewController() : presentAlert()
    }

    private func presentAlert() {
        let alert = UIAlertController(title: L10n.unavailable, message: nil, preferredStyle: .alert)
        alert.addAction(.init(title: L10n.yes, style: .default))
        navigationController?.present(alert, animated: true)
    }

    private func presentNextViewController() {
        print("next")
    }
}

class StartView: UIView {
    let startScanButton: UIButton = {
        let button = UIButton()
        var config = UIButton.Configuration.filled()
        config.title = L10n.startToScan
        button.configuration = config
        return button
    }()

    init() {
        super.init(frame: .zero)
        setup()
    }

    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setup() {
        addSubview(startScanButton)
        startScanButton.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
    }
}

//
//  SuccessfullyOrNotSuccessfullyController.swift
//  Betus2
//
//  Created by Gio's Mac on 28.12.24.
//

import UIKit
import SnapKit

class SuccessfullyOrNotSuccessfullyController: UIViewController {
    private lazy var firstBubleBackground: UIImageView = {
        let view = UIImageView(frame: .zero)
        view.image = UIImage(named: "appleLogoFrame")
        view.contentMode = .scaleAspectFit
        return view
    }()

    private lazy var secondBubleBackground: UIImageView = {
        let view = UIImageView(frame: .zero)
        view.image = UIImage(named: "appleLogoFrame")
        view.contentMode = .scaleAspectFit
        return view
    }()

    private lazy var successOrWrongView: SuccessOrWrongView = {
        let view = SuccessOrWrongView()
        view.backgroundColor = .topBottomViewColorGray
        view.makeRoundCorners(24)
        view.onOkeyButton = { [weak self] in
            self?.moveToMainDashboard()
        }
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        setup()
        setupConstraints()
    }

    private func setup() {
        view.addSubview(firstBubleBackground)
        view.addSubview(secondBubleBackground)
        view.addSubview(successOrWrongView)
    }

    private func setupConstraints() {
        firstBubleBackground.snp.remakeConstraints { make in
            make.bottom.equalTo(view.snp.bottom).offset(-116)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(432)
        }

        secondBubleBackground.snp.remakeConstraints { make in
            make.bottom.equalTo(view.snp.bottom).offset(-14)
            make.leading.equalTo(view.snp.leading).offset(10)
            make.trailing.equalTo(view.snp.trailing).offset(6)
            make.height.equalTo(432)
        }

        successOrWrongView.snp.remakeConstraints { make in
            make.bottom.equalTo(view.snp.bottom).offset(-24)
            make.leading.trailing.equalToSuperview().inset(16)
            make.height.equalTo(295)
        }
    }

    private func moveToMainDashboard() {
        for controller in navigationController?.viewControllers ?? [] {
            if let dashboard = controller as? MainDashboardScene {
                navigationController?.popToViewController(dashboard, animated: true)
                return
            }
        }
    }
}

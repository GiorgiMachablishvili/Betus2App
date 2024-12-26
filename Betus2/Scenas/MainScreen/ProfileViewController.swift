//
//  ProfileViewController.swift
//  Betus2
//
//  Created by Gio's Mac on 26.12.24.
//

import UIKit
import SnapKit

class ProfileViewController: UIViewController {

    private lazy var staticView: TrainingStaticView = {
        let view = TrainingStaticView()
        view.makeRoundCorners(32)
        view.backgroundColor = .topBottomViewColorGray
        view.onBackButtonTap = { [weak self] in
            self?.navigationMainDashboard()
        }
        return view
    }()

    private lazy var helperView: HelperProfileView = {
        let view = HelperProfileView()
        view.makeRoundCorners(32)
        view.backgroundColor = .topBottomViewColorGray
        return view
    }()

    private lazy var warningImage: UIImageView = {
        let view = UIImageView(frame: .zero)
        view.image = UIImage(named: "warningImage")
        view.contentMode = .scaleAspectFit
        return view
    }()

    private lazy var deleteButton: UIButton = {
        let view = UIButton(frame: .zero)
        view.setTitle("Delete Account", for: .normal)
        view.setTitleColor(UIColor.whiteColor, for: .normal)
        view.titleLabel?.font = UIFont.goldmanRegular(size: 14)
        view.makeRoundCorners(23)
        view.backgroundColor = .topBottomViewColorGray
        view.addTarget(self, action: #selector(pressDeleteButton), for: .touchUpInside)
        return view
    }()

    private lazy var signInButton: UIButton = {
        let view = UIButton(frame: .zero)
        view.setTitle("Sing In", for: .normal)
        view.setTitleColor(UIColor.whiteColor, for: .normal)
        view.titleLabel?.font = UIFont.goldmanRegular(size: 14)
        view.makeRoundCorners(23)
        view.backgroundColor = .redColor
        view.isHidden = true
        view.addTarget(self, action: #selector(pressSignInButton), for: .touchUpInside)
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        setupConstraints()
    }

    private func setup() {
        view.addSubview(staticView)
        view.addSubview(helperView)
        view.addSubview(warningImage)
        view.addSubview(deleteButton)
        view.addSubview(signInButton)
    }

    private func setupConstraints() {
        staticView.snp.remakeConstraints { make in
            make.top.equalTo(view.snp.top).offset(48)
            make.leading.trailing.equalToSuperview().inset(16)
            make.height.equalTo(247)
        }

        helperView.snp.remakeConstraints { make in
            make.top.equalTo(staticView.snp.bottom).offset(8)
            make.leading.trailing.equalToSuperview().inset(16)
            make.height.equalTo(220)
        }

        warningImage.snp.remakeConstraints { make in
            make.top.equalTo(helperView.snp.bottom).offset(8)
            make.leading.trailing.equalToSuperview().inset(16)
            make.height.equalTo(81)
        }

        deleteButton.snp.remakeConstraints { make in
            make.top.equalTo(warningImage.snp.bottom).offset(8)
            make.leading.trailing.equalToSuperview().inset(16)
            make.height.equalTo(44)
        }

        signInButton.snp.remakeConstraints { make in
            make.top.equalTo(helperView.snp.bottom).offset(8)
            make.leading.trailing.equalToSuperview().inset(32)
            make.height.equalTo(44)
        }
    }

    private func navigationMainDashboard() {
        navigationController?.popViewController(animated: true)
    }

    @objc func pressDeleteButton() {

    }

    @objc func pressSignInButton() {

    }
}

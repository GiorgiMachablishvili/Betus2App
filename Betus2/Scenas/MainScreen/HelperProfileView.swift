//
//  HelperProfileView.swift
//  Betus2
//
//  Created by Gio's Mac on 26.12.24.
//

import UIKit
import SnapKit

class HelperProfileView: UIView {

    private lazy var privacyPolicyButton: UIButton = {
        let view = UIButton(frame: .zero)
        view.setTitle("Privacy policy", for: .normal)
        view.setTitleColor(UIColor.whiteColor, for: .normal)
        view.titleLabel?.font = UIFont.goldmanRegular(size: 14)
        view.makeRoundCorners(23)
        view.backgroundColor = .grayCalendarPoints
        view.addTarget(self, action: #selector(pressPrivacyPolicyButton), for: .touchUpInside)
        return view
    }()

    private lazy var termsOfUseButton: UIButton = {
        let view = UIButton(frame: .zero)
        view.setTitle("Terms of use", for: .normal)
        view.setTitleColor(UIColor.whiteColor, for: .normal)
        view.titleLabel?.font = UIFont.goldmanRegular(size: 14)
        view.makeRoundCorners(23)
        view.backgroundColor = .grayCalendarPoints
        view.addTarget(self, action: #selector(pressTermsOfUseButton), for: .touchUpInside)
        return view
    }()

    private lazy var rateUsButton: UIButton = {
        let view = UIButton(frame: .zero)
        view.setTitle("Terms of use", for: .normal)
        view.setTitleColor(UIColor.whiteColor, for: .normal)
        view.titleLabel?.font = UIFont.goldmanRegular(size: 14)
        view.makeRoundCorners(23)
        view.backgroundColor = .grayCalendarPoints
        view.addTarget(self, action: #selector(pressRateUsButton), for: .touchUpInside)
        return view
    }()

    private lazy var supportButton: UIButton = {
        let view = UIButton(frame: .zero)
        view.setTitle("Terms of use", for: .normal)
        view.setTitleColor(UIColor.whiteColor, for: .normal)
        view.titleLabel?.font = UIFont.goldmanRegular(size: 14)
        view.makeRoundCorners(23)
        view.backgroundColor = .grayCalendarPoints
        view.addTarget(self, action: #selector(pressSupportButton), for: .touchUpInside)
        return view
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)

        setup()
        setupConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setup() {
        addSubview(privacyPolicyButton)
        addSubview(termsOfUseButton)
        addSubview(rateUsButton)
        addSubview(supportButton)
    }

    private func setupConstraints() {
        privacyPolicyButton.snp.remakeConstraints { make in
            make.top.equalTo(snp.top).offset(16)
            make.leading.trailing.equalToSuperview().inset(16)
            make.height.equalTo(44)
        }

        termsOfUseButton.snp.remakeConstraints { make in
            make.top.equalTo(privacyPolicyButton.snp.bottom).offset(4)
            make.leading.trailing.equalToSuperview().inset(16)
            make.height.equalTo(44)
        }

        rateUsButton.snp.remakeConstraints { make in
            make.top.equalTo(termsOfUseButton.snp.bottom).offset(4)
            make.leading.trailing.equalToSuperview().inset(16)
            make.height.equalTo(44)
        }

        supportButton.snp.remakeConstraints { make in
            make.top.equalTo(rateUsButton.snp.bottom).offset(4)
            make.leading.trailing.equalToSuperview().inset(16)
            make.height.equalTo(44)
        }
    }

    @objc func pressPrivacyPolicyButton() {

    }

    @objc func pressTermsOfUseButton() {

    }

    @objc func pressRateUsButton() {

    }

    @objc func pressSupportButton() {

    }

}

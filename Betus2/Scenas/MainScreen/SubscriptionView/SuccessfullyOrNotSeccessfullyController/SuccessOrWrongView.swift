//
//  SuccessOrWrongView.swift
//  Betus2
//
//  Created by Gio's Mac on 29.12.24.
//

import UIKit
import SnapKit

class SuccessOrWrongView: UIView {

    private lazy var succseeTitle: UILabel = {
        let view = UILabel(frame: .zero)
        view.text = "Successfully"
        view.font = UIFont.goldmanBold(size: 36)
        view.numberOfLines = 2
        view.textColor = .whiteColor

        return view
    }()

    private lazy var welcomeLabel: UILabel = {
        let view = UILabel(frame: .zero)
        view.text = "Welcome to the pro level, new features are now available to you:"
        view.font = UIFont.goldmanBold(size: 12)
        view.numberOfLines = 2
        view.textColor = .grayCalendarDayName

        return view
    }()

    private lazy var subscriptionBenefits: UIImageView = {
        let view = UIImageView(frame: .zero)
        view.image = UIImage(named: "subscrioptionBenefits")
        view.contentMode = .scaleAspectFit
        return view
    }()

    private lazy var wrongTitle: UILabel = {
        let view = UILabel(frame: .zero)
        view.text = "Something went wrong"
        view.font = UIFont.goldmanBold(size: 36)
        view.numberOfLines = 2
        view.textColor = .whiteColor
        view.isHidden = true
        return view
    }()

    private lazy var wrongInfoLabel: UILabel = {
        let view = UILabel(frame: .zero)
        view.text = "What could have happened:"
        view.font = UIFont.goldmanBold(size: 12)
        view.numberOfLines = 2
        view.textColor = .grayCalendarDayName
        view.isHidden = true
        return view
    }()

    private lazy var pointOne: UIView = {
        let view = UIView(frame: .zero)
        view.backgroundColor = .whiteColor
        view.makeRoundCorners(2)
        view.isHidden = true
        return view
    }()

    private lazy var featuresLabel: UILabel = {
        let view = UILabel(frame: .zero)
        view.text = "Be the first to know about new features"
        view.font = UIFont.goldmanBold(size: 12)
        view.numberOfLines = 2
        view.textColor = .whiteColor
        view.isHidden = true
        return view
    }()

    private lazy var pointTwo: UIView = {
        let view = UIView(frame: .zero)
        view.backgroundColor = .whiteColor
        view.makeRoundCorners(2)
        view.isHidden = true
        return view
    }()

    private lazy var customLabel: UILabel = {
        let view = UILabel(frame: .zero)
        view.text = "Contact customer"
        view.font = UIFont.goldmanBold(size: 12)
        view.textColor = .whiteColor
        view.isHidden = true
        return view
    }()

    private lazy var supportButton: UIButton = {
        let view = UIButton(frame: .zero)
        let attributedTitle = NSAttributedString(
            string: "support",
            attributes: [
                .font: UIFont.goldmanRegular(size: 12),
                .foregroundColor: UIColor.grayCalendarDayName,
                .underlineStyle: NSUnderlineStyle.single.rawValue
            ]
        )
        view.setAttributedTitle(attributedTitle, for: .normal)
        view.backgroundColor = .clear
        view.addTarget(self, action: #selector(didPressSupportButton), for: .touchUpInside)
        view.isHidden = true
        return view
    }()

    private lazy var okeyButton: UIButton = {
        let view = UIButton(frame: .zero)
        view.setTitle("Okey", for: .normal)
        view.backgroundColor = .redColor
        view.makeRoundCorners(16)
        view.titleLabel?.font = UIFont.goldmanRegular(size: 14)
        view.titleLabel?.textColor = UIColor.whiteColor
        view.addTarget(self, action: #selector(didPressOkeyButtonButton), for: .touchUpInside)
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
        addSubview(succseeTitle)
        addSubview(welcomeLabel)
        addSubview(subscriptionBenefits)
        addSubview(okeyButton)
        addSubview(wrongTitle)
        addSubview(wrongInfoLabel)
        addSubview(pointOne)
        addSubview(featuresLabel)
        addSubview(pointTwo)
        addSubview(customLabel)
        addSubview(supportButton)
    }

    private func setupConstraints() {
        succseeTitle.snp.remakeConstraints { make in
            make.top.equalTo(snp.top).offset(24)
            make.leading.trailing.equalToSuperview().inset(16)
            make.height.greaterThanOrEqualTo(43)
        }

        wrongTitle.snp.remakeConstraints { make in
            make.top.equalTo(snp.top).offset(24)
            make.leading.trailing.equalToSuperview().inset(16)
            make.height.greaterThanOrEqualTo(43)
        }

        welcomeLabel.snp.remakeConstraints { make in
            make.top.equalTo(succseeTitle.snp.bottom).offset(8)
            make.leading.trailing.equalToSuperview().inset(16)
            make.height.lessThanOrEqualTo(32)
        }

        wrongInfoLabel.snp.remakeConstraints { make in
            make.top.equalTo(wrongTitle.snp.bottom).offset(8)
            make.leading.trailing.equalToSuperview().inset(16)
            make.height.lessThanOrEqualTo(32)
        }

        okeyButton.snp.remakeConstraints { make in
            make.bottom.equalTo(snp.bottom).offset(-16)
            make.leading.trailing.equalToSuperview().inset(16)
            make.height.equalTo(48)
        }

        subscriptionBenefits.snp.remakeConstraints { make in
            make.bottom.equalTo(okeyButton.snp.top).offset(-32)
            make.leading.trailing.equalToSuperview().inset(16)
            make.height.equalTo(64)
        }

        pointOne.snp.remakeConstraints { make in
            make.bottom.equalTo(pointTwo.snp.top).offset(-15)
            make.leading.equalTo(snp.leading).offset(20)
            make.height.width.equalTo(4)
        }

        featuresLabel.snp.remakeConstraints { make in
            make.centerY.equalTo(pointOne.snp.centerY)
            make.leading.equalTo(pointOne.snp.trailing).offset(10)
            make.height.equalTo(14)
        }

        pointTwo.snp.remakeConstraints { make in
            make.bottom.equalTo(okeyButton.snp.top).offset(-39)
            make.leading.equalTo(snp.leading).offset(20)
            make.height.width.equalTo(4)
        }

        customLabel.snp.remakeConstraints { make in
            make.centerY.equalTo(pointTwo.snp.centerY)
            make.leading.equalTo(pointOne.snp.trailing).offset(10)
            make.height.equalTo(14)
        }

        supportButton.snp.remakeConstraints { make in
            make.centerY.equalTo(pointTwo.snp.centerY)
            make.leading.equalTo(customLabel.snp.trailing).offset(3)
            make.height.equalTo(14)
        }

    }

    @objc private func didPressOkeyButtonButton() {

    }

    @objc private func didPressSupportButton() {

    }
}

//
//  MonthlySubscriptionView.swift
//  Betus2
//
//  Created by Gio's Mac on 28.12.24.
//

import UIKit

class MonthlySubscriptionView: UIView {

    private lazy var circleImage: UIImageView = {
        let view = UIImageView(frame: .zero)
        view.image = UIImage(named: "circuleImage")
        view.contentMode = .scaleAspectFit
        return view
    }()

    lazy var fillCircleImage: UIImageView = {
        let view = UIImageView(frame: .zero)
        view.image = UIImage(named: "fillCircle")
        view.contentMode = .scaleAspectFit
        view.isHidden = true
        return view
    }()

    private lazy var subscriptionDurationTitle: UILabel = {
        let view = UILabel(frame: .zero)
        view.text = "Monthly"
        view.font = UIFont.goldmanRegular(size: 14)
        view.textColor = .whiteColor
        return view
    }()

    private lazy var discountedPriceLabel: UILabel = {
        let view = UILabel(frame: .zero)
        view.text = "$ 1.99"
        view.font = UIFont.goldmanRegular(size: 14)
        view.textColor = .whiteColor
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
        addSubview(circleImage)
        circleImage.addSubview(fillCircleImage)
        addSubview(subscriptionDurationTitle)
        addSubview(discountedPriceLabel)
    }

    private func setupConstraints() {
        circleImage.snp.remakeConstraints { make in
            make.centerY.equalTo(snp.centerY)
            make.leading.equalTo(snp.leading).offset(14)
            make.height.width.equalTo(16)
        }

        fillCircleImage.snp.remakeConstraints { make in
            make.center.equalTo(circleImage.snp.center)
            make.height.width.equalTo(12)
        }

        subscriptionDurationTitle.snp.remakeConstraints { make in
            make.centerY.equalTo(circleImage.snp.centerY)
            make.leading.equalTo(circleImage.snp.trailing).offset(8)
            make.height.equalTo(17)
        }

        discountedPriceLabel.snp.remakeConstraints { make in
            make.centerY.equalTo(circleImage.snp.centerY)
            make.trailing.equalTo(snp.trailing).offset(-12)
            make.height.equalTo(17)
        }
    }
}

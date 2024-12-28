//
//  SubscriptionView.swift
//  Betus2
//
//  Created by Gio's Mac on 28.12.24.
//

import UIKit
import SnapKit

class SubscriptionView: UIView {

    var onGoProButtonTap: (() -> Void)?

    private lazy var subscriptionTitle: UILabel = {
        let view = UILabel(frame: .zero)
        view.text = "Subscription to Pro Level"
        view.font = UIFont.goldmanBold(size: 36)
        view.numberOfLines = 2
        view.textColor = .whiteColor
        return view
    }()

    private lazy var subscriptionInfo: UILabel = {
        let view = UILabel(frame: .zero)
        view.text = "Think you need more content to become a real pro, subscribe and enjoy: "
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

    var yearlySubscription: YearlySubscriptionView = {
        let view = YearlySubscriptionView()
        view.backgroundColor = .topBottomViewColorGray
        view.makeRoundCorners(12)
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.grayCalendarPoints.cgColor
        return view
    }()

    var monthlySubscription: MonthlySubscriptionView = {
        let view = MonthlySubscriptionView()
        view.backgroundColor = .topBottomViewColorGray
        view.makeRoundCorners(12)
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.grayCalendarPoints.cgColor
        return view
    }()

    private lazy var goToProButton: UIButton = {
        let view = UIButton(frame: .zero)
        view.setImage(UIImage(named: "goToProButton"), for: .normal)
        view.addTarget(self, action: #selector(didPressGoToProButton), for: .touchUpInside)
        return view
    }()

    private lazy var cancelButton: UIButton = {
        let view = UIButton(frame: .zero)
        view.setTitle("Cancel", for: .normal)
        view.titleLabel?.font = UIFont.goldmanRegular(size: 14)
        view.setTitleColor(UIColor.whiteColor, for: .normal)
        view.backgroundColor = .clear
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
        addSubview(subscriptionTitle)
        addSubview(subscriptionInfo)
        addSubview(subscriptionBenefits)
        addSubview(yearlySubscription)
        addSubview(monthlySubscription)
        addSubview(goToProButton)
        addSubview(cancelButton)
    }

    private func setupConstraints() {
        subscriptionTitle.snp.remakeConstraints { make in
            make.top.equalTo(snp.top).offset(24)
            make.leading.trailing.equalToSuperview().inset(16)
            make.height.equalTo(86)
        }

        subscriptionInfo.snp.remakeConstraints { make in
            make.top.equalTo(subscriptionTitle.snp.bottom).offset(8)
            make.leading.trailing.equalToSuperview().inset(16)
            make.height.equalTo(28)
        }

        subscriptionBenefits.snp.remakeConstraints { make in
            make.top.equalTo(subscriptionInfo.snp.bottom).offset(32)
            make.leading.trailing.equalToSuperview().inset(16)
            make.height.equalTo(64)
        }

        yearlySubscription.snp.remakeConstraints { make in
            make.top.equalTo(subscriptionBenefits.snp.bottom).offset(32)
            make.leading.trailing.equalToSuperview().inset(16)
            make.height.equalTo(44)
        }

        monthlySubscription.snp.remakeConstraints { make in
            make.top.equalTo(yearlySubscription.snp.bottom).offset(4)
            make.leading.trailing.equalToSuperview().inset(16)
            make.height.equalTo(44)
        }

        goToProButton.snp.remakeConstraints { make in
            make.bottom.equalTo(snp.bottom).offset(-72)
            make.leading.trailing.equalToSuperview().inset(16)
            make.height.equalTo(48)
        }

        cancelButton.snp.remakeConstraints { make in
            make.top.equalTo(goToProButton.snp.bottom).offset(8)
            make.leading.trailing.equalToSuperview().inset(16)
            make.height.equalTo(48)
        }
    }

    @objc private func didPressGoToProButton() {
        onGoProButtonTap?()
    }
}

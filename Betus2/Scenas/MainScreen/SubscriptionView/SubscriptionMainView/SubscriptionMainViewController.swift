//
//  SubscriptionMainViewController.swift
//  Betus2
//
//  Created by Gio's Mac on 28.12.24.
//

import UIKit
import SnapKit

class SubscriptionMainViewController: UIViewController {

    private lazy var tennisBackground: UIImageView = {
        let view = UIImageView(frame: .zero)
        view.image = UIImage(named: "appleLogoFrame")
        view.contentMode = .scaleAspectFit
        return view
    }()

    private lazy var tennisBlurImage: UIImageView = {
        let view = UIImageView(frame: .zero)
        view.image = UIImage(named: "tennisBlurImage")
        view.contentMode = .scaleAspectFit
        return view
    }()

    private lazy var volleyballBackground: UIImageView = {
        let view = UIImageView(frame: .zero)
        view.image = UIImage(named: "appleLogoFrame")
        view.contentMode = .scaleAspectFit
        return view
    }()

    private lazy var volleyballBlurImage: UIImageView = {
        let view = UIImageView(frame: .zero)
        view.image = UIImage(named: "volleyballBlurImage")
        view.contentMode = .scaleAspectFit
        return view
    }()

    private lazy var basketballBackground: UIImageView = {
        let view = UIImageView(frame: .zero)
        view.image = UIImage(named: "appleLogoFrame")
        view.contentMode = .scaleAspectFit
        return view
    }()

    private lazy var basketballBlurImage: UIImageView = {
        let view = UIImageView(frame: .zero)
        view.image = UIImage(named: "basketballBlurImage")
        view.contentMode = .scaleAspectFit
        return view
    }()

    private lazy var subscriptionView: SubscriptionView = {
        let view = SubscriptionView()
        view.backgroundColor = .topBottomViewColorGray
        view.makeRoundCorners(24)
        view.onGoProButtonTap = { [weak self] in
            self?.moveSuccsOrNotView()
        }
        return view
    }()


    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        setupConstraints()
        addGestureRecognizers()
    }

    private func setup() {
        view.addSubview(tennisBackground)
        tennisBackground.addSubview(tennisBlurImage)
        view.addSubview(volleyballBackground)
        volleyballBackground.addSubview(volleyballBlurImage)
        view.addSubview(basketballBackground)
        basketballBackground.addSubview(basketballBlurImage)
        view.addSubview(subscriptionView)
    }

    private func setupConstraints() {
        tennisBackground.snp.remakeConstraints { make in
            make.top.equalTo(view.snp.top).offset(-69)
            make.leading.equalTo(view.snp.leading).offset(211)
            make.height.width.equalTo(260)
        }

        tennisBlurImage.snp.remakeConstraints { make in
            make.center.equalTo(tennisBackground.snp.center)
            make.height.width.equalTo(140)
        }

        volleyballBackground.snp.remakeConstraints { make in
            make.top.equalTo(view.snp.top).offset(149)
            make.leading.equalTo(view.snp.leading).offset(-103)
            make.height.width.equalTo(260)
        }

        volleyballBlurImage.snp.remakeConstraints { make in
            make.center.equalTo(volleyballBackground.snp.center)
            make.height.width.equalTo(140)
        }

        basketballBackground.snp.remakeConstraints { make in
            make.top.equalTo(view.snp.top).offset(284)
            make.trailing.equalTo(view.snp.trailing).offset(86)
            make.height.width.equalTo(260)
        }

        basketballBlurImage.snp.remakeConstraints { make in
            make.center.equalTo(basketballBackground.snp.center)
            make.height.width.equalTo(140)
        }

        subscriptionView.snp.remakeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(16)
            make.bottom.equalTo(view.snp.bottom).offset(-24)
            make.height.equalTo(518)
        }
    }

    private func addGestureRecognizers() {
        let yearlyTapGesture = UITapGestureRecognizer(target: self, action: #selector(didTapYearlySubscription))
        subscriptionView.yearlySubscription.addGestureRecognizer(yearlyTapGesture)
        subscriptionView.yearlySubscription.isUserInteractionEnabled = true

        let monthlyTapGesture = UITapGestureRecognizer(target: self, action: #selector(didTapMonthlySubscription))
        subscriptionView.monthlySubscription.addGestureRecognizer(monthlyTapGesture)
        subscriptionView.monthlySubscription.isUserInteractionEnabled = true
    }

    @objc private func didTapYearlySubscription() {
        updateSubscriptionSelection(
            selectedView: subscriptionView.yearlySubscription,
            deselectedView: subscriptionView.monthlySubscription
        )
    }

    @objc private func didTapMonthlySubscription() {
        updateSubscriptionSelection(
            selectedView: subscriptionView.monthlySubscription,
            deselectedView: subscriptionView.yearlySubscription
        )
    }
    private func updateSubscriptionSelection(selectedView: UIView, deselectedView: UIView) {
        if let yearlyView = selectedView as? YearlySubscriptionView {
            yearlyView.backgroundColor = .grayCalendarDayName
            yearlyView.fillCircleImage.isHidden = false
        } else if let monthlyView = selectedView as? MonthlySubscriptionView {
            monthlyView.backgroundColor = .grayCalendarDayName
            monthlyView.fillCircleImage.isHidden = false
        }

        if let yearlyView = deselectedView as? YearlySubscriptionView {
            yearlyView.backgroundColor = .topBottomViewColorGray
            yearlyView.fillCircleImage.isHidden = true
        } else if let monthlyView = deselectedView as? MonthlySubscriptionView {
            monthlyView.backgroundColor = .topBottomViewColorGray
            monthlyView.fillCircleImage.isHidden = true
        }
    }

    private func moveSuccsOrNotView() {
        let succOrNotVC = SuccessfullyOrNotSuccessfullyController()
        navigationController?.pushViewController(succOrNotVC, animated: true)
    }
}
